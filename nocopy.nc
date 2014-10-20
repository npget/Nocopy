<?php
public function __webViewN($q){
      
      if (strlen($q)>3){
      
      $sql="SELECT * from `ADVEOPRODUCT`  where
      DescrizioneBreve LIKE '%$q%' or NomeCategoria LIKE '%$q%' or  NomeBrand LIKE '%$q%'
      or CodiceSpicers LIKE '%$q%'  LIMIT  0, 100 ";
      $r=connxAdveo()->query($sql);
      if(mysqli_num_rows($r)>0){
	 
	 
      $o="<div id='Adveo' style='overflow-y:scroll;height:450px;' >";
      
      while ($rt=mysqli_fetch_array($r)){
         extract($rt);
	 
   $urlimg2="http://www.e.it/img_e/".$CodiceSpicers."A1.jpg";
   $urlimg="http://www.e.it/img_e/".$CodiceSpicers."A1.jpg";

$upast="./img1/".$CodiceSpicers."_(npget).jpg";

	 if(file_exists($urlimg2)){
  // $urlimg='./n/_function/img/'.$CodiceSpicers.'.jpg';
 
 $urllink=urlencode($NomeBrand)."=".$CodiceSpicers.".sh";
 
 if (!@copy($urlimg2,$upast) ) {
        $error=error_get_last();
	
	$o.= $error['message']."<h1>Copy NO success!</h1>Copy failed.";
       }else{
        $o.= "<h1>Copy success!</h1>";
        }
   $urlimg=$urlimg;
    }else{
      $o.=$urlimg;
      $urlimg='../menuimg/jp.png';
      }
$o.= "<div>
<img src='$upast'>$upast
<img src='$urlimg2' width='10%' >$urlimg2
<br>
<a href=''> ".iconv("windows-1252","UTF-8",$DescrizioneBreve)."-$NomeBrand-".$ListinoA*2.30."<br>
</div>";
        
      }
//      print_r($rt);
   return $o."</div>";
   
   }
   
      }else{ return "Result:0 Rg 85";}
   }
   
   ?>
