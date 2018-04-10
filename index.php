<?php
// Bootstrap 4 Navigation Bar, fixed-top, blue XSLT theme.

ini_set('display_errors', 'On');
error_reporting(E_ALL);

if(isset($_GET['p'])) $p = $_GET['p'];
else $p="1";

// Load XML file
$xml = new DOMDocument;
$xml->load('data/website.xml');

// Load XSL file
$xsl = new DOMDocument;
$xsl->load('xslt/theme2fprm.xsl');

// Configure the transformer
$proc = new XSLTProcessor;
$proc->setParameter('', 'page', intval($p));

// Attach the xsl rules
$proc->importStyleSheet($xsl);

echo $proc->transformToXML($xml);
?>