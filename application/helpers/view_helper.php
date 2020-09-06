<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

function is_invoice_complete($data) {
  if ($data->total_with_tax > 0) {
    return ($data->amount_paid < $data->total_with_tax) ? false : true;
  }

  return ($data->amount_paid < $data->total_notax) ? false : true;
}
