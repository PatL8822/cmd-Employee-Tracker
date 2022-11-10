INSERT INTO department (name)
VALUES ('Engineering'),('Finance'),('Leagle'),('Sales');

INSERT INTO role (title, salary, department_id)
VALUES  ('Lead Engineer', 150000.00, 1),
        ('Engineer', 100000.00, 2),
        ('Accountant', 90000.00, 1),
        ('Lawyer', 200000.00, 1),
        ('Sales Rep.', 50000.00, 1);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES  ('Json', 'Stringaify', 1, 2),
        ('Const', 'Ti-var', 2, 1),
        ('Switch', 'Case', 3, null),
        ('Stella', 'Artois', 4, 4),
        ('Walter', 'White', 5, null);