def makeANewReservationClicked(self):
        self.functionWindow.withdraw()
        self.makeANewReservationWindow=Tk()
        self.makeANewReservationWindow.title("Train Sales System")
        self.buildMakeANewReservationWindow(self.makeANewReservationWindow)
        self.makeANewReservationWindow.Toplevel()

def buildMakeANewReservationWindow(self,makeANewReservationWindow):
        # Title Label
        titleLabel= Label(makeANewReservationWindow,text = "Search Train")
        titleLabel.grid(row=1,column=2,sticky=W+E)
        # Labels
        departsFromLabel= Label(makeANewReservationWindow,text = "Departs From")
        departsFromLabel.grid(row=2,column=1)
        arrivesAtLabel= Label(makeANewReservationWindow,text = "Arrives At")
        arrivesAtLabel.grid(row=3,column=1)
        departureDateLabel= Label(makeANewReservationWindow,text = "Departure Date")
        departureDateLabel.grid(row=4,column=1)
        # Button
        findTrainsButton = Button(makeANewReservationWindow, text="Find Trains", command=self.findTrainsButtonClicked)
        findTrainsButton.grid(row=5, column=3)
        #drop down menu
        departsFromDate=StringVar(makeANewReservationWindow)
        
        #get stop informatin from the database. Below names are for demos only.
        
        departsFromDate.set("Boston(BBY)")
        departsFrom = OptionMenu(makeANewReservationWindow, departsFromDate, "New York", "Atlanta", "LA")
        departsFrom.grid(row=2,column=2)
        
        arrivesAtDate=StringVar(makeANewReservationWindow)
        arrivesAtDate.set("New York(Penn Station)")
        arrivesAt = OptionMenu(makeANewReservationWindow, arrivesAtDate, "Boston(BBY)", "Atlanta", "LA")
        arrivesAt.grid(row=3,column=2)

        #save a space for calender
        calenderLabel= Label(makeANewReservationWindow,text = "Departs From")
        calenderLabel.grid(row=4,column=2)
