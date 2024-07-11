*** Settings ***
Documentation    Consumindo a rota enrollments da API REST

Resource     ../base.resource


*** Keywords ***
POST New Enroll
    [Arguments]    ${token}    ${student_id}

    ${headers}    Create Dictionary    Authorization=${token}

    ${start_date}    Get Current Date

    ${enroll}    Create Dictionary
    ...    start_date=${start_date}
    ...    plan_id=1
    ...    student_id=${student_id}

    ${admin}    Get Fixture    Admin    

    ${response}    POST    http://localhost:3333/enrollments
    ...                    headers=${headers}
    ...                    expected_status=201
    ...                    json=${enroll}
