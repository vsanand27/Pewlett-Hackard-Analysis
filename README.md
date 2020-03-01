# Pewlett-Hackard-Analysis
Human Resource Analytics - Reviewing Retiring population via attrition and Potential recruitment opportunities utilizing SQL, quick database diagram website of ERD and PgAdmin

# Purpose
Purpose of this assignment is to help Human Resource analyze thier concern for retiring population and solicit future leaders as mentor to replace the aging population.  This is a concern for many companies these days.  

Our task is to develop database for Pewlett-Hackard that will store and analyze employee that will
1.	Describe the relationships between employee tables to show Enterprise Relationship Diagram
2.	Provide analysis of in-sope Retired Employees to show future risk due to Aging Poplulation
3.	Develop list of Potential employee ideally born in 1965 who would be good candidates for a supervisory/mentorship roles.

## ERD TABLE - Employee Schema 

The table show Enterprise Wide Database for Employees with underlying relationship between various  tables.  All Queries are based on these underlying tables.  The primary Key's and Foreign keys in between employee tables help link information between tables. 

![alt text](https://github.com/vsanand27/Pewlett-Hackard-Analysis/blob/master/EmployeeDB_v2.PNG)


## Retiree Title Count Analysis

Pewlett-Hackard is faced with aging population that is about to retire.  We developed the dataset based on the instructions.  The scope of analysis was based on defining aging population with birth date between years 1952 to 1955 and hire date between years 1985 to 1988 that are current utilizing to_date in dept employee table.  The Query returned 54,722 that includes multiple titles held at various times by the retirerment population. 

Therefore, we recommed to include in the title table and utilize "to_date" to obtain the most current title based.  The result set will bring 33,118 actual titles currently held by retired employees to appropriately measure the exposure for Pewlett-Hackard based on retiring population.

![alt text](https://github.com/vsanand27/Pewlett-Hackard-Analysis/blob/master/Retiree_title_Count_with_and_without_duplication.PNG)

## Potential Mentorship Opportunities for Employees born in 1965

Pewlett-Hackard is looking at titles with people born in 1965 that will be able to supervise and become mentors for the organization as the next generation of steward leaders of the business.  The problem idenitified is that we only have 1,549 potential mentors and the aging population is 33,118.  

Based on the result, we propose to train the mentors for the new opportunities, Flexible work hours to delay retirement, and meanwhile recruit new talent to train and develop skills required for the strategic posiiton of the company.

![alt text](https://github.com/vsanand27/Pewlett-Hackard-Analysis/blob/master/Mentor_title_count_summary.PNG)
