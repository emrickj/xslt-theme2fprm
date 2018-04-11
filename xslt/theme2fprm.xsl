<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:param name="page"/>

<xsl:output method="html" doctype-system="about:legacy-compat" encoding="utf-8" indent="yes" />

<xsl:template match="website">
<html lang="{page[position()=$page]/@language}">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<title><xsl:value-of select="title"/></title>
<style>
@media (min-width: 576px) {
	form label {text-align: right;}
}
<xsl:value-of select="style" disable-output-escaping="yes" />
</style>
</head>
<body class='page{$page}' id='demo'>
<nav class="navbar navbar-expand-md bg-primary navbar-dark fixed-top">
  <a class="navbar-brand" href="#"><xsl:value-of select="title"/></a>
  <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#myNavbar">
	<span class="navbar-toggler-icon"></span>
  </button>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="navbar-nav">
	  <xsl:apply-templates select="page" />
      </ul>
    </div>
</nav>
   <div class="container" style="padding-top: 56px;">
      <div class="row">
         <div class="col-md-2">
         </div>
         <div class="col-md-8">
            <img class='img-fluid' src='{page[position()=$page]/image}' />
            <br />
         </div>
         <div class="col-md-2">
         </div>
      </div>
      <div class="row">
         <div class="col-md-2">
         </div>
         <div class="col-md-8">
		     <xsl:apply-templates select="page[position()=$page]/contents" />
         </div>
         <div class="col-md-2">
         </div>
      </div>
   </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>

</xsl:template>

<xsl:template match="page">
	<xsl:if test="string-length(name) &gt; 2">
		<li class='nav-item'>
		  <a class='nav-link' href='?p={position()}'>
			<xsl:if test="position() = $page">
			   <xsl:attribute name="class">nav-link active</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="substring(name,2,1)=' '">
				   <i class="fa"><xsl:value-of select="substring(name,1,1)" /></i>
				   <xsl:value-of select="substring(name,2)" />
				</xsl:when>
				<xsl:otherwise>
				   <xsl:value-of select="name" disable-output-escaping="yes" />
				</xsl:otherwise>
			</xsl:choose>
		  </a>
		</li>
	</xsl:if>
</xsl:template>

<xsl:template match="contents">
	<xsl:value-of select="." disable-output-escaping="yes" />
	<xsl:if test="../@type='comments'">
		 <div id='HCB_comment_box' style='color: inherit; background-color: inherit;'>   <a href="https://www.htmlcommentbox.com">HTML Comment Box</a> is loading comments...</div>
		 <link rel="stylesheet" type="text/css" href="https://www.htmlcommentbox.com/static/skins/default/skin.css" />
		 <script type="text/javascript" language="javascript" id="hcb">
		 <![CDATA[			 
		 if(!window.hcb_user){hcb_user={  };} (function(){s=document.createElement("script");s.setAttribute("type","text/javascript");s.setAttribute("src", "https://www.htmlcommentbox.com/jread?page="+escape((window.hcb_user && hcb_user.PAGE)||(""+window.location)).replace("+","%2B")+"&opts=470&num=10");if (typeof s!="undefined") document.getElementsByTagName("head")[0].appendChild(s);})();
		 ]]>
		 </script>
		 <!-- end htmlcommentbox.com -->
	</xsl:if>
	<xsl:if test="../@type='form'">
	   <form class="form-horizontal" role="form" method="post">
		  <div class="form-group row">
			 <label class="col-form-label col-sm-4" for="name">Name:</label>
			 <div class="col-sm-6">
				<input type="text" class="form-control" name="name" />
			 </div>
		  </div>
		  <div class="form-group row">
			 <label class="col-form-label col-sm-4" for="email">Email Address:</label>
			 <div class="col-sm-6">
				<input type="email" class="form-control" name="email" />
			 </div>
		  </div>
		  <div class="form-group row">
			 <label class="col-form-label col-sm-4" for="subject">Subject:</label>
			 <div class="col-sm-6">
				<input type="text" class="form-control" name="subject" />
			 </div>
		  </div>
		  <div class="form-group row">
			 <label class="col-form-label col-sm-4" for="message">Message:</label>
			 <div class="col-sm-6">
				<textarea class="form-control" rows="5" name="message"></textarea>
				<br />
				<input type="submit" class="btn btn-primary" value="Submit" />
			 </div>
		  </div>
	   </form>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>