<?php

function register($data)
{
    include("config.php");


    
function random_n($length)
    {
        $key = '';
        $keys = array_merge(range('0', '9'));

        for ($i = 0; $i < $length; $i++) {
            $key .= $keys[array_rand($keys)];
        }
        return $key;    }

    //    $id = $_POST['in_Id'];

    $patients_id = "PA-" . random_n(8);
    $patients_firstname = $data->userFirstName;
    $date = date("Y-m-d H:i:s");
    $patients_lastname = $data->userLastName;
    $patients_email = $data->userEmail;
    $patients_phone = $data->userPhone;
    $patients_residence = $data->userPhone;
    $patients_close_relative_firstname = $data->userCloseFirstName;
    $patients_close_relative_lastname = $data->userCloseLastName;
    $patients_close_relative_phone = $data->userClosePhone;
    $patients_password = $data->userPassword;

    // $id = $_POST['in_Id'];
    // $patients_id = $_POST['Patients_Id'];
    // $patients_firstname = $_POST['Patients_Firstname'];
    // $date = date("Y-m-d H:i:s");
    // $patients_lastname = $_POST['Patients_Lastname'];
    // $patients_email = $_POST['Patients_Email'];
    // $patients_phone = $_POST['Patients_Phone'];
    // $patients_residence = $_POST['Patients_Residence'];
    // $patients_close_relative_firstname = $_POST['Patients_Close_Relative_Firstname'];
    // $patients_close_relative_lastname = $_POST['Patients_Close_Relative_Lastname'];
    // $patients_close_relative_phone = $_POST['Patients_Close_Relative_Phone'];
    // $patients_password = $_POST['Patients_Password'];

    // $id = $_POST['in_Id'];
    // $patients_id = "PA-".random_n(8);
    // $patients_firstname = 'Patients_Firstname';
    // $date = date("Y-m-d H:i:s");
    // $patients_lastname ='Patients_Lastname';
    // $patients_email ='Patients_Email';
    // $patients_phone = 'Patients_Phone';
    // $patients_residence = 'Patients_Residence';
    // $patients_close_relative_firstname = 'Patients_Close_Relative_Firstname';
    // $patients_close_relative_lastname = 'Patients_Close_Relative_Lastname';
    // $patients_close_relative_phone = 'Patients_Close_Relative_Phone';
    // $patients_password ="Patients_Password";

    $sql = "INSERT INTO patients (id,patients_id,patients_firstname,patients_lastname,patients_email,patients_phone,patients_residence,patients_close_relative_firstname,patients_close_relative_lastname,patients_close_relative_phone,patients_password,date) VALUES (null,:patients_id,:patients_firstname,:patients_lastname,:patients_email,:patients_phone,:patients_residence,:patients_close_relative_firstname,:patients_close_relative_lastname,:patients_close_relative_phone,:patients_password,:date)";
    $query = $dbConn->prepare($sql);
    // $query->bindparam(':id', $id);
    $query->bindparam(':patients_id', $patients_id);
    $query->bindparam(':patients_firstname', $patients_firstname);
    $query->bindparam(':patients_lastname', $patients_lastname);
    $query->bindparam(':patients_email', $patients_email);
    $query->bindparam(':patients_phone', $patients_phone);
    $query->bindparam(':patients_residence', $patients_residence);
    $query->bindparam(':patients_close_relative_firstname', $patients_close_relative_firstname);
    $query->bindparam(':patients_close_relative_lastname', $patients_close_relative_lastname);
    $query->bindparam(':patients_close_relative_phone', $patients_close_relative_phone);
    $query->bindparam(':patients_password', $patients_password);
    $query->bindparam(':date', $date);
    if ($query->execute()) {
        $dbConn = null;
        $payload = array('userId' => $patients_id, 'message' => 'success');
       return json_encode($payload);
    }else
    {
        $dbConn = null;
        $payload = array('message' => 'failed');
       return json_encode($payload);
    }
    
    $dbConn = null;
// header("Location:../../index.php");
}
?>