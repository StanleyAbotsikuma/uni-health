<?php


function login($data)
{
    include("config.php");
    // $result = $dbConn->query("SELECT * FROM patients ORDER BY id DESC");
    // while($row = $result->fetch(PDO::FETCH_ASSOC)) { 
    // }
    $email  ="Patients_Email";
    $password= "Patients_Password";


    // $email  =$data->userEmail;
    // $password= $data->userPassword;
    
    
    $stmt =$dbConn->prepare("SELECT * FROM patients WHERE patients_email=:patients_email  AND patients_password=:patients_password"); 

    // $stmt->bindValue(':patients_password', $password);
    if ($stmt->execute(array(":patients_email" => $email, 
    ":patients_password" => $password))) {
        $queryData = $stmt->fetch(PDO::FETCH_ASSOC);
        // $query = $stmt->fetchColumn();
        if($queryData)
    {
      
        $payload = array(
        'message' => 'success',
        'userId' => $queryData['patients_id'] , 
        'userFirstName' =>  $queryData['patients_firstname'], 
        'userLastName' => $queryData['patients_lastname'] ,
        'userPhone' =>  $queryData['patients_phone'] , 
        'userEmail' => $queryData['patients_email'] , 
        'userResidence' => $queryData['patients_residence'] , 
        'userCloseFirstName' =>$queryData['patients_close_relative_firstname'] , 
        'userCloseLastName' => $queryData['patients_close_relative_lastname'] , 
        'userClosePhone' => $queryData['patients_close_relative_phone'],
        'userDateRegistered' => $queryData['date'],  
        //  'userId' => $SingleVar 
        ); 
        
        $dbConn = null;
       return json_encode($payload);

    }
    else{
        $dbConn = null;
        $payload = array('message' => 'failed');
        return json_encode($payload);
    }
       
    }else
    {
        $dbConn = null;
        $payload = array('message' => 'failed');
       return json_encode($payload);
    }
    
  
   // $dbConn = null;
}



?>