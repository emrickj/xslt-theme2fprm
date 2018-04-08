<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" doctype-system="about:legacy-compat" encoding="utf-8" indent="yes" />

<xsl:template match="/">
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<title><xsl:value-of select="website/title"/></title>
  <style>
  body {
      position: relative; 
  }
  #p1 {padding-top:50px;}
  #p2 {padding-top:50px;color: #fff; background-color: #1E88E5;}
  #p3 {padding-top:50px;color: #fff; background-color: #673ab7;}
  #p4 {padding-top:50px;color: #fff; background-color: #ff9800;}
  #p5 {padding-top:50px;color: #fff; background-color: #00bcd4;}
  #p6 {padding-top:50px;color: #fff; background-color: #009688;}


     </style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#"><xsl:value-of select="website/title"/></a>
    </div>
    <div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
		<xsl:for-each select="website/page">
		 <xsl:if test="string-length(name) &gt; 2">
			 <li>
			   <a href="#p{position()}">
			   <xsl:value-of select="name" disable-output-escaping="yes" />
			   </a>
			 </li>
		 </xsl:if>
		</xsl:for-each>
        </ul>
      </div>
    </div>
  </div>
</nav>

<xsl:for-each select="website/page">
  <xsl:if test="string-length(name) &gt; 2">
	<div id="p{position()}" class='container-fluid' lang="{@language}">
		<img class='img-responsive' style='display: block;margin: auto;' src='{image}' />
		<xsl:value-of select="contents" disable-output-escaping="yes" />
		<xsl:if test="@type='comments'">
			 <div id='HCB_comment_box' style='color: inherit; background-color: inherit;'>   <a href="https://www.htmlcommentbox.com">HTML Comment Box</a> is loading comments...</div>
			 <link rel="stylesheet" type="text/css" href="https://www.htmlcommentbox.com/static/skins/default/skin.css" />
			 <script type="text/javascript" language="javascript" id="hcb">
             <![CDATA[			 
			 if(!window.hcb_user){hcb_user={  };} (function(){s=document.createElement("script");s.setAttribute("type","text/javascript");s.setAttribute("src", "https://www.htmlcommentbox.com/jread?page="+escape((window.hcb_user && hcb_user.PAGE)||(""+window.location)).replace("+","%2B")+"&opts=470&num=10");if (typeof s!="undefined") document.getElementsByTagName("head")[0].appendChild(s);})();
			 ]]>
			 </script>
			 <!-- end htmlcommentbox.com -->
		</xsl:if>
		<xsl:if test="@type='form'">
			<form class="form-horizontal" role="form" method="post">
				<div class="form-group">
				   <label class="control-label col-sm-3" for="name">Name:</label>
				   <div class="col-sm-6">
					  <input type="text" class="form-control" name="name" />
				   </div>
				</div>
				<div class="form-group">
				   <label class="control-label col-sm-3" for="phone">Contact Phone #:</label>
				   <div class="col-sm-6">
					  <input type="text" class="form-control" name="phone" />
				   </div>
				</div>
				<div class="form-group">
				   <label class="control-label col-sm-3" for="email">Email Address:</label>
				   <div class="col-sm-6">
					  <input type="email" class="form-control" name="email" />
				   </div>
				</div>
				<div class="form-group">
				   <label class="control-label col-sm-3" for="message">Message:</label>
				   <div class="col-sm-6">
					  <textarea class="form-control" rows="5" name="message"></textarea>
					  <br />
					  <input type="submit" class="btn btn-default" value="Submit" />
				   </div>
				</div>
			</form>
		</xsl:if>
	</div>
  </xsl:if>
</xsl:for-each>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
</xsl:template>

</xsl:stylesheet>