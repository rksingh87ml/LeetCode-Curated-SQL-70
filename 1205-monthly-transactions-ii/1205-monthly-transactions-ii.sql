
with Transactions_CTE as 
            (

                select 
                    id, amount, trans_date, country, 'approved' as status
                from Transactions
                where state = 'approved'
                union all 
                select 
                    trans.id , amount, chg.trans_date,trans.country ,'chargeback' as status
                from Transactions trans
                join Chargebacks chg on chg.trans_id = trans.id 

            )

    select 
        date_format(trans_date,'%Y-%m') as month,
        country,
        sum(case when status = 'approved' then 1 else 0 end) as approved_count,
        sum(case when status = 'approved' then amount else 0 end) as approved_amount,
        sum(case when status = 'chargeback' then 1 else 0 end) as chargeback_count,
        sum(case when status = 'chargeback' then amount else 0 end) as chargeback_amount
    from 
    Transactions_CTE
    group by month , country 

