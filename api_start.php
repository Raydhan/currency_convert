<?php 

$To = $_REQUEST['to'];
$From = $_REQUEST['from'];
$Amount = $_REQUEST['amount'];

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "https://api.apilayer.com/currency_data/convert?to='$To'&from='$From'&amount='$Amount'",
  CURLOPT_HTTPHEADER => array(
    "Content-Type: text/plain",
    "apikey: 376Ih7VcAkNHz2LaERDGgmKU2hS9W3L2"
  ),
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_FOLLOWLOCATION => true,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET"
));

$response = curl_exec($curl);

curl_close($curl);
echo $response;

 ?>
