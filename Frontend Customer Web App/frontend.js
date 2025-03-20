// Connecting to the Frontend
import React, { useEffect, useState } from 'react';

function CustomerProfileManagement() {
    const [customers, setCustomers] = useState([]);

    useEffect(() => {
        async function fetchCustomers() {
            const response = await fetch('http://localhost:3000/customers');
            const data = await response.json();
            setCustomers(data);
        }
        fetchCustomers();
    }, []);

    return (
        <div>
            <h2>Customer Profile Management</h2>
            <table border="1" cellPadding="8">
                <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Address</th>
                        <th>Identification No</th>
                    </tr>
                </thead>
                <tbody>
                    {customers.map(customer => (
                        <tr key={customer.id}>
                            <td>{customer.first_name}</td>
                            <td>{customer.last_name}</td>
                            <td>{customer.email}</td>
                            <td>{customer.mobile}</td>
                            <td>{customer.address}</td>
                            <td>{customer.identification_no}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}

export default CustomerProfileManagement;