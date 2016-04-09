    def viewTrainScheduleClicked(self):
        self.functionWindow.withdraw()
        self.viewTrainScheduleWindow = Tk()
        self.viewTrainScheduleWindow.title("Train Sales System")
        self.buildViewTrainScheduleWindow(self.viewTrainScheduleWindow)
        self.viewTrainScheduleWindow.Toplevel()


    def buildViewTrainScheduleWindow(self,viewTrainScheduleWindow):
        # Title Label
        viewTrainScheduleLabel = Label(viewTrainScheduleWindow, text="View Train Schedule")
        viewTrainScheduleLabel.grid(row=1, column=1, sticky=W+E)
        # Train Number Label
        trainNumberLabel = Label(viewTrainScheduleWindow, text="Train Number")
        trainNumberLabel.grid(row=2, column=1, sticky=W)

        #Train Number Entry
        self.TrainNumer = StringVar()
        trainNumberEntry = Entry(viewTrainScheduleWindow, textvariable = self.password, width=20)
        trainNumberEntry.grid(row=2, column=2, sticky=E)

        # Buttons
        searchButton = Button(viewTrainScheduleWindow, text="Search", command=self.searchButtonClicked)
        searchButton.grid(row=3, column=1)


    def searchButtonClicked(self):
        self.viewTrainScheduleWindow.withdraw()
        self.viewTrainScheduleWindow2 = Tk()
        self.viewTrainScheduleWindow2.title("Train Sales System")
        self.buildViewTrainScheduleWindow2(self.viewTrainScheduleWindow)
        self.viewTrainScheduleWindow2.Toplevel()




