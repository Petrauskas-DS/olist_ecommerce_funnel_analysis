select mql_id, count(*) as occcurrences
from qualified_leads
group by mql_id
having count(*) >1;

