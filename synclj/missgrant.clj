
(def controller-grammar
  (grammar
     Stm = stm symbol Events Resets Commands {State}
     Events = events "events" {Event} "end"
     Event = event symbol symbol
     Resets = resets "resetEvents" {symbol} "end"
     Commands = commands "commands" {Command} "end"
     Command = command symbol symbol
     State = state "state" symbol [Actions] {Transition} "end"
     Actions = actions "actions" "{" {symbol} "}"
     Transition = transition symbol "=>" symbol))

(defmacro ctl
  {:grammar controller-grammar}
  [ast]
  (list 'quote ast))
  
;(defmacro defctl
;  {:grammar controller-grammar}
;  [ast]
;  (let [init (initial ast) trans (transmap ast) tokens (tokenmap ast) actions (actionmap ast)]
;  `(fn [input# output#] 
; 	 (loop [input input# output output# state '~initial]
;       (do
;         ~@(map #( ) trans)  
         

(def gothic	
  (ctl miss-grant
	events
	 doorClosed D1CL
	 drawerOpened D2OP
	 lightOn L1ON
	 doorOpened D1OP
	 panelClosed PNCL end 

	resetEvents
	 doorOpened 
	end 
	
	commands
	 unlockPanel PNUL
	 lockPanel PNLK
	 lockDoor D1LK
	 unlockDoor D1UL
	 end 	
	
	state idle	
	 actions {unlockDoor lockPanel}
	 doorClosed => active 
	end 
	
	state active
	 drawerOpened => waitingForLight
	 lightOn => waitingForDrawer 
	end 
	
	state waitingForLight
	 lightOn => unlockedPanel 
	end 
	
	state waitingForDrawer
	 drawerOpened => unlockedPanel 
	end 
	
	state unlockedPanel
	 actions {unlockPanel lockDoor}
	 panelClosed => idle 
	end ))