<?php
class SelectStmt{
    
    protected $tableName;
    protected $where;
    protected $whereClauses;
    protected $pageSize;
    protected $page;
    protected $offset;
    
    function __construct() {
        $this->pageSize = 50;
        $this->offset = 0;
        $this->page = 1;
        $this->whereClauses = array();
    }
    
    function getQuery(){
       $query = "SELECT * FROM  ".$this->tableName.$this->where;
       if($this->page == 1){
           $this->offset = 0;
       }else{
           $this->offset = ($this->page * $this->pageSize) - $this->pageSize;
       }
       if(sizeof($this->whereClauses) > 0){
           $ord = $this->whereClauses[0]->getColumn();
           $query = $query." ORDER BY ".$ord." ";
       }
       $query = $query." LIMIT ".$this->offset.", ".$this->pageSize;
       
       return $query;
    }
    
    function getCountQuery(){
        $query = "SELECT count(*) FROM  ".$this->tableName.$this->where;
       
        return $query;
    }
    
    function getPageSize(){
        return $this->pageSize;
    }
    
    function setTableName($tn){
        $this->tableName = $tn;
    }
    
    function setParams($params){
        foreach($params as $key => $value){
            if($key == "pageSize"){
                $this->pageSize = $value;
            }elseif($key == "page"){
                $this->page = $value;
            }elseif($key == "q"){
                $val = "'%".strtoupper($value)."%'";
                $this->where = " WHERE UPPER(registry_id) LIKE $val 
                        or UPPER(primary_name) LIKE $val 
                        or UPPER(city_name) LIKE $val 
                        or UPPER(county_name) LIKE $val 
                        or UPPER(state_code) LIKE $val 
                        or UPPER(state_name) LIKE $val 
                        or UPPER(country_name) LIKE $val 
                        or UPPER(postal_code) LIKE $val 
                        or UPPER(site_type_name) LIKE $val ";
            }else{
                $wc = new WhereClause();
                $wc->setColumn($this->camelCaseToUnderScore($key));
                $wc->setValue("%$value%");
                array_push($this->whereClauses, $wc);
            }
        }
        if(sizeof($this->whereClauses) > 0){
              $this->where = $this->createWhere();
        }
    }
    
    function setWhereClauses($wc){
        $this->whereClauses = $wc;
        $this->where = $this->createWhere();
    }
    
    private function camelCaseToUnderScore($input) {
        preg_match_all('!([A-Z][A-Z0-9]*(?=$|[A-Z][a-z0-9])|[A-Za-z][a-z0-9]+)!', $input, $matches);
        $ret = $matches[0];
        foreach ($ret as &$match) {
            $match = $match == strtoupper($match) ? strtolower($match) : lcfirst($match);
        }
        return implode('_', $ret);
    }

    private function createWhere(){
        
        if($this->whereClauses == null){
            return "";
        }
        $where = " WHERE ";
        $size = sizeof($this->whereClauses);
        
        for($i = 0; $i < $size; $i++){
            $wc = $this->whereClauses[$i];
            $where = $where." ".$wc->getClause()." ";
            if($i != $size - 1){
                $where = $where." AND ";
            }
            
        }
        
        return $where;
    }
}

class WhereClause{
    
    const OP_LIKE = " LIKE ";
    const OP_EQUAL = " = ";
    
    private $column;
    private $operator;
    private $value;
    
    function __construct() {
        $this->operator = self::OP_LIKE;
    }
    
    function setColumn($c){
        $this->column = $c;
    }
    function getColumn(){
        return $this->column;
    }
    function setOperator($o){
        $this->operator = $o;
    }
    function getOperator(){
        return $this->operator;
    }
    function setValue($v){
        $this->value = strtoupper($v);
    }
    function getValue(){
        return $this->value;
    }
    function getClause(){
        return $this->column." ".$this->operator." '".$this->value."'";
    }
}
?>