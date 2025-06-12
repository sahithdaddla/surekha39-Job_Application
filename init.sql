CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    referral_id VARCHAR(50) UNIQUE NOT NULL,
    role VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(10) NOT NULL,
    guardian_name VARCHAR(100) NOT NULL,
    guardian_phone VARCHAR(10) NOT NULL,
    address TEXT NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    submission_date TIMESTAMP NOT NULL,
    approval_date TIMESTAMP,
    rejection_date TIMESTAMP,
    rejection_reason TEXT
);


CREATE TABLE documents (
    id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES employees(id) ON DELETE CASCADE,
    document_type VARCHAR(50) NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    file_type VARCHAR(50) NOT NULL,
    file_data TEXT NOT NULL,
    upload_date TIMESTAMP NOT NULL,
    CONSTRAINT unique_employee_document UNIQUE (employee_id, document_type)
);


CREATE TABLE previous_employment (
    id SERIAL PRIMARY KEY,
    employee_id INTEGER UNIQUE REFERENCES employees(id) ON DELETE CASCADE,
    company VARCHAR(100),
    role VARCHAR(100),
    experience INTEGER,
    relieving_letter_name VARCHAR(255),
    relieving_letter_type VARCHAR(50),
    relieving_letter_data TEXT,
    relieving_letter_upload_date TIMESTAMP
);

CREATE INDEX idx_employees_referral_id ON employees(referral_id);
CREATE INDEX idx_employees_email ON employees(email);
CREATE INDEX idx_documents_employee_id ON documents(employee_id);
CREATE INDEX idx_previous_employment_employee_id ON previous_employment(employee_id);
