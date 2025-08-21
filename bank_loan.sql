SELECT * FROM finance.bank;

#1. Total Loan Applications: 
Select count(distinct id) as total_LoanApplication
from  Bank;

#1b. Total Loan Applications: for MTD (where last month is December and Year is 2021)
Select count(distinct id) as total_LoanApplication
from  Bank
where  Month(issue_date)=12 and Year(issue_date)= 2021;

#1c. Total Loan Applications for PMTD (where last month is December and Year is 2021)
Select count(distinct id) as total_LoanApplication
from  Bank
where Month(issue_date)=11  and Year(issue_date)= 2021;

#2.Total Funded Amount disbursed from bank

Select sum(loan_amount) as Total_funded_amount
from bank ;

#2a.Total Funded Amount disbursed from bank MTD
Select sum(loan_amount) as Total_funded_amount
from bank 
where month(issue_date) =12 ;


#2b.Total Funded Amount disbursed from bank on basis of PMTD
Select sum(loan_amount) as Total_funded_amount
from bank
where Month(issue_date)=11 ;

#3.Total Amount Received by the bank
Select sum(total_payment) as Total_fund_recieved
from Bank ;

#3a.Total Amount Received by the bank on basis of MTD
Select sum(total_payment) as MTD_Total_recieved
from Bank 
where month(issue_date) =12;

#3b.Total Amount Received by the bank on basis of PMTD
Select sum(total_payment) as PMTD_Total_Recieved
from Bank 
where month(issue_date) =11;

#4. Average Interest Rate
Select sum(int_rate) as Avg_rate
from bank;

#4a. Average Interest Rate on basis of MTD
Select sum(int_rate) as MTD_Avg_rate
from bank
where month(issue_date) =12;

#4b. Average Interest Rate on basis of PMTD
Select sum(int_rate) as PMTD_Avg_rate
from bank
where month(issue_date) =11;

#5: Average Debt-to-Income Ratio (Dti)
Select sum(dti) as Avg_dti 
from Bank;

#5a: Average Debt-to-Income Ratio (Dti) on basis of MTD
Select sum(dti) as MTD_Avg_dti 
from Bank
where month(issue_date) =12;

#5b: Average Debt-to-Income Ratio (Dti) on basis of PMTD
Select sum(dti) as PMTD_Avg_dti 
from Bank
where month(issue_date) =11;

#6  Good Loan Application Percentage
With loan_summary as(
     Select  count(*) as total_loan ,
     Count(case when loan_status in ('Fully Paid','Current') Then 1
     end ) as good_loan_count 
     from bank ) ,
     Percentage as (Select (good_loan_count/total_loan )*100 as Percentage_amnt from loan_summary)
	Select* from percentage ;
    
    #7.Good Loan Applications
    Select  Count(case  when loan_status in ('Fully Paid' , 'Current') Then 1 end ) as good_loan_application
    from bank;
    
    #8. Loan Funded Amount
    Select sum(loan_amount)  as funded_amnt
    from bank
    where loan_status in ('Fully Paid' ,'Current');
    
    #9 Good Loan Total Received Amount
    Select sum(total_payment)  as funded_amnt_recieved
    from bank
    where loan_status in ('Fully Paid','Current');
    
    #10:  Bad Loan Application Percentage
     With loan_summary as(
     Select  count(*) as total_loan ,
     Count(case  when loan_status in ('Charged Off') Then 1
     end ) as bad_loan_count 
     from bank ) ,
     Percentage as (  Select (bad_loan_count/total_loan )*100 as  Percentage_amnt from loan_summary)
	  Select* from percentage ;
    
    #11: Bad Loan Applications
    Select  Count(case  when loan_status in ('Charged Off') Then 1 end ) as bad_loan_application
    from bank;
    
    #12: Loan Funded Amount
    Select Sum(loan_amount)  as funded_amnt
    from bank
    where loan_status ='Charged Off';
  
    #13: Good Loan Total Received Amount
    Select sum(total_payment)  as funded_amnt_recieved
    from bank
     where loan_status ='Charged Off';
     
     
#14: Loan Status 
Select loan_status , count(id) as total_application ,
         Sum(loan_amount) as funded_amnt,
         Sum(total_payment) as Recieved_payment,
         Sum(int_rate) as Avg_intRate,
         Sum(dti) as Avg_dti
         from bank
         group by loan_status ;
         
#15: Loan Status on Month-to-date
 Select loan_status ,
Sum(loan_amount) as MTD_funded_amnt,
Sum(total_payment) as MTD_Recieved_payment
from bank
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status ;

#16. Monthly Trends by Issue Date
select month(issue_date) As month_number,
monthname(issue_date) As month_name,
count(id) as total_application,
sum(loan_amount) as total_funded_Amnt,
sum(total_payment) as total_Amnt_Received
from bank
group by month_number,month_name
order by month_number;

#17: Loan Term Analysis
select term as loan_term,
count(id) as total_application,
sum(loan_amount) as total_funded_Amnt,
sum(total_payment) as total_Amnt_Received
from bank
group by loan_term
order by loan_term;

#18: Employee Length Analysis
select emp_length,
count(id) as total_application,
sum(loan_amount) as total_funded_Amnt,
sum(total_payment) as total_Amnt_Received
from bank
group by emp_length
order by emp_length;

#19: Loan Purpose Breakdown
select purpose,
count(id) as total_application,
sum(loan_amount) as total_funded_Amnt,
sum(total_payment) as total_Amnt_Received
from bank
group by purpose
order by purpose;

#20: Home Ownership Analysis
select home_ownership,
count(id) as total_application,
sum(loan_amount) as total_funded_Amnt,
sum(total_payment) as total_Amnt_Received
from bank
group by home_ownership
order by home_ownership;

#21: Regional Analysis by State 
select address_state as state,
count(id) as total_application,
sum(loan_amount) as total_funded_Amnt,
sum(total_payment) as total_Amnt_Received
from bank
group by state
order by state;






         









































