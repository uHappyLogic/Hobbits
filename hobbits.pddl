(define
	(domain hobbits)
	(:requirements :adl)
	(:types platform hobbit line)
	(:predicates
		(BushOnPlatform ?p - platform)
		
		(Horizontal ?p1 ?p2 - platform)
		(Vertical ?bottom ?up - platform)
		
		(HobbitOnPlatform ?h - hobbit ?p - platform)
		
		(HaveLine ?h - hobbit ?l - line)
		
		(ConnectedWithLine ?p1 ?p2)
	)
	
	(:action UseLine
		:parameters(?up ?bottom - platform ?h - hobbit ?l - line)
		:precondition
		(and
			(not (= ?up ?bottom))
			(HobbitOnPlatform ?h ?up)
			(Vertical ?bottom ?up)
			(HaveLine ?h ?l)
			(BushOnPlatform ?up)
			(not (ConnectedWithLine ?up ?bottom))
		)
		:effect
		(and
			(ConnectedWithLine ?up ?bottom)
			(not (HaveLine ?h ?l))
		)
	)
	
	(:action GoVertical
		:parameters(?from ?to - platform ?h - hobbit)
		:precondition
		(and
			(not (= ?from ?to))
			(or
				(ConnectedWithLine ?from ?to)
				(ConnectedWithLine ?to ?from)
			)
			(HobbitOnPlatform ?h ?from)
		)
		:effect
		(and
			(not (HobbitOnPlatform ?h ?from))
			(HobbitOnPlatform ?h ?to)
		)
	)
	
	(:action GoHorizontal
		:parameters (?from ?to - platform ?h - hobbit)
		:precondition
		(and
		
		)
		:effect
		(and
		
		)
	)
	
)