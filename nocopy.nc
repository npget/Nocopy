// Qui Cè la Query ...$r=query;
//$CodiceSpicers VIENE DAL DB ..

      $o="<div id='Adveo' style='overflow-y:scroll;height:450px;' >";
      
      while ($rt=mysqli_fetch_array($r)){
         extract($rt);
	 
   $urlimg2="http://www.x.it/x/img_e/".$CodiceSpicers."A1.jpg";

   $urlimg="http://www.x.it/x/img_e/".$CodiceSpicers."A2.jpg";

// La dIR della Mia Macchina dove vogliono si popolono le img 
$upast="./img1/".$CodiceSpicers."_(npget).jpg";


	 if(file_exists($urlimg2)){

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
</div>";
        
      }
//      print_r($rt);
   return $o."</div>";
   
   }
   
      }else{ return "Result:0 Rg 85";}
   }
   
   
