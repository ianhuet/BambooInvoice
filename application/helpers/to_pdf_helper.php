<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Try increasing memory available, mostly for PDF generation
 */
//ini_set("memory_limit","64M");
use Dompdf\Dompdf;

function pdf_create($html, $filename, $stream=TRUE) 
{
//	require_once(APPPATH."helpers/dompdf/dompdf_config.inc.php"); 
//  require_once("dompdf/dompdf_config.inc.php");
    require_once(APPPATH."helpers/dompdf/autoload.inc.php");
	
	$dompdf = new Dompdf();
	$dompdf->setPaper("A4", "portrait"); 
	$dompdf->loadHtml($html);
	$dompdf->render();
	if ($stream) {
		$dompdf->stream($filename.".pdf");
	}

	write_file(APPPATH."../invoices_temp/$filename.pdf", $dompdf->output());
}
?>