*** Settings ***
Documentation    Consumindo a rota students da API REST

Resource    ../base.resource


*** Keywords ***
POST New Student
    [Arguments]    ${token}    ${student}

    ${headers}    Create Dictionary    Authorization=${token}

    ${admin}    Get Fixture    Admin    

    ${response}    POST    http://localhost:3333/students
    ...                    headers=${headers}
    ...                    expected_status=201
    ...                    json=${student}

    RETURN    ${response.json()}[id]

POST Question
    [Arguments]    ${student_id}    ${question_text}

    ${payload}    Create Dictionary    question=${question_text}

    
    POST    http://localhost:3333/students/${student_id}/help-orders
    ...     json=${payload}
    ...     expected_status=201

