<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<h2>Image Maps</h2>
<p>Click on the sun or on one of the planets to watch it closer:</p>

<img src="images/c1.jpg" alt="Planets" usemap="#planetmap" 
	style="width:50%;height:50%;">

<map name="planetmap">
  <area shape="rect" coords="0,0,32,36" alt="Sun" href="sun.htm"
  	style="border:3px solid red">
  <area shape="circle" coords="90,58,3" alt="Mercury" href="mercur.htm"
  	style="border:3px solid blue">
  <area shape="circle" coords="124,58,8" alt="Venus" href="venus.htm"
  	style="border:3px solid green">
</map>

</body>
</html>