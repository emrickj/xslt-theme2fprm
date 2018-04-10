<?php
// Bootstrap Scrollspy XSLT theme.

ini_set('display_errors', 'On');
error_reporting(E_ALL);

// Load XML file
$xml = new DOMDocument;
$xml->load('data/website.xml');

// Load XSL file
$xsl = new DOMDocument;
$xsl->load('xslt/theme3.xsl');

// Configure the transformer
$proc = new XSLTProcessor;

// Attach the xsl rules
$proc->importStyleSheet($xsl);

echo $proc->transformToXML($xml);
?>
