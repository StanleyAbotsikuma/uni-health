<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");


include_once 'doctor.php';
include_once 'login.php';
include_once 'diagnoses.php';
include_once 'medication.php';
include_once 'register.php';

$data = json_decode(file_get_contents("php://input"));


if (!empty($data->token) && !empty($data->password) && !empty($data->type)) 
{

    if ($data->token == "giRGfB56pBShzNFfW3wCES748GxRxHb3TTNrxZVJd") {

        if ($data->password == "SrrheFCdvhrX2TKF3sAaTmv3ubguRFJnumQD4MMxW") {

            if ($data->type == "diagnoses") {

            }
            else if ($data->type == "doctor") {
            }
            else if ($data->type == "medication") {
            }
            else if ($data->type == "register") {
               echo(register($data));
            }
            
            else if ($data->type == "login") {

                echo(login($data));
            }
            else {
                echo json_encode(array("comment" => "Type not stated"));
            }




            // if($items->update()){     
            // 	http_response_code(200);   
            // 	echo json_encode(array("comment" => ""));
            // }else{    
            // 	http_response_code(503);     
            // 	echo json_encode(array("comment" => "Unable to update items."));
            // }
            http_response_code(200);
        }
        else {

            echo json_encode(array("comment" => "Type not stated"));

        }
    }
    else {
        http_response_code(403);
        echo json_encode(array("comment" => "Restricted Access"));

    }





}
else {
    http_response_code(403);
    echo json_encode(array("comment" => "Restricted Access"));
}
?>