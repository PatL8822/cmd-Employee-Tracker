const inquirer = require('inquirer');
const mysql = require('mysql2');
require('console.table');

//connecting to data base
const db = mysql.createConnection(
    {
        host: 'localhost',
        user: 'root',
        password: 'password',
        database: 'EmployeeTracker_db'
    },
);



function questionIndex() {
    inquirer.prompt([{
        type: 'list',
        message: 'Make a selection.',
        name: 'selectQ',
        choices: [
            'View All Departments',
            'View All Roles',
            'View All Employees',
            'Add Department',
            'Add Role',
            'Add An Employee',
            'Update Employee Role',
            'Finished',
        ],
    }]).then((data) => {
        switch (data.selectQ) {
            case 'View All Departments':
                departments();
                break;
            case 'View All Roles':
                roles();
                break;
            case 'View All Employees':
                viewEmployees();
                break;
            case 'Add Department':
                addDepartment();
                break;
            case 'Add Role':
                addRole();
                break;
            case 'Add An Employee':
                addEmployee();
                break;
            case 'Update Employee Role':
                updateEmployee();
                break;
            default: end();
        };
    });
};

function departments() {
    db.query('SELECT id AS "ID", name AS "Departments" FROM department'
        , function (err, result) {
            if (err) {
                console.log(err);
            } else {
                console.table(result);
            }
            questionIndex()
        });
};

function roles() {
    db.query('SELECT id AS "Role ID", title AS "Departments", salary AS "Salary", department_id as "Department ID" FROM role'
        , function (err, result) {
            if (err) {
                console.log(err);
            } else {
                console.table(result);
            }
            questionIndex()
        });

};

function viewEmployees() {
    db.query('SELECT id AS "Employee ID", first_name AS "First Name", last_name AS "Last Name", role_id as "Role ID", manager_id AS "Manager ID" FROM employee', function (err, result) {
        if (err) {
            console.log(err);
        } else {
            console.table(result);
        }
        questionIndex()
    });
};

function addDepartment() {
    inquirer.prompt([{
        type: 'input',
        message: 'Add department name.',
        name: 'dept'
    }]).then((data) => {
        db.query('INSERT INTO department(name) WHERE name = ?'), [data.dept], (err, result) => {
            if (err) {
                console.log(err);
            } else {
                console.table(result);
            }
            questionIndex()
        }
    });
};


function addRole() {
}


function addEmployee() {
}



function updateEmployee() {


};

function end() {
    process.exit();
};

questionIndex();