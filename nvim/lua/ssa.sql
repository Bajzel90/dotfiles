DECLARE @CentralAccount VARCHAR;

set @centralaccount
= 'UB97KR'
;

select p.centralaccount, g.cn, r.ident_unsroot
from unsaccount u
join ldapaccountinldapgroup l on l.uid_ldapaccount = u.uid_unsaccount
join person p on p.uid_person = u.uid_person
join unsgroup g on g.uid_unsgroup = l.uid_ldapgroup
join unsroot r on r.uid_unsroot = g.uid_unsroot
where p.centralaccount = @centralaccount

union

select p.centralaccount, g.cn, r.ident_unsroot
from unsaccount u
join adsaccountinadsgroup a on a.uid_adsaccount = u.uid_unsaccount
join person p on p.uid_person = u.uid_person
join unsgroup g on g.uid_unsgroup = a.uid_adsgroup
join unsroot r on r.uid_unsroot = g.uid_unsroot
where p.centralaccount = @centralaccount

