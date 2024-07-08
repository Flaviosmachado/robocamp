*** Settings ***
Documentation        Gerenciando a massa de testes atraves do banco de dados

Library    DatabaseLibrary

*** Keywords ***
Connect To PostGress
    Connect To Database    psycopg2
    ...                    postgres
    ...                    postgres.tbpgmxxaisgqcxeovifb
    ...                    QWLZuv8UuGSOm1M8
    ...                    aws-0-sa-east-1.pooler.supabase.com
    ...                    6543

Select Student Where Email
    [Arguments]    ${email}

    ${query}    Set Variable
    ...         SELECT * FROM students where email = '${email}'

    ${result}    Query    ${query}

    RETURN    ${result}[0]

Delete Enroll By email


    [Arguments]    ${email}

    ${user}    Select Student Where Email    ${email}

    ${query}    Set Variable
    ...         DELETE FROM enrollments where student_id = '${user}[0]'

    Execute Sql String    ${query}

Reset student enroll
    [Arguments]        ${mail}  

    Connect To PostGress
    Delete Enroll By email    ${mail}
    Disconnect From Database