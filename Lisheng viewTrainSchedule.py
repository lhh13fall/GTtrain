    import ttk
    from tkinter import *

    def viewTrainScheduleClicked(self):

        self.createViewTrainScheduleWindow()
        self.buildViewTrainScheduleWindow(self.viewTrainScheduleWindow)
        self.functionWindow.withdraw()


    def createViewTrainScheduleWindow(self):
        self.viewTrainScheduleWindow = Toplevel()
        self.viewTrainScheduleWindow.title("Train Sales System")

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

        self.createViewTrainScheduleWindow2
        self.buildViewTrainScheduleWindow2(self.viewTrainScheduleWindow2)

        self.viewTrainScheduleWindow.withdraw()

    def createViewTrainScheduleWindow2(self):
        self.viewTrainScheduleWindow2 = Toplevel()
        self.viewTrainScheduleWindow2.title("Train Sales System")

    def bulidViewTrainScheduleWindow2(self,viewTrainScheduleWindow2):
        viewTrainScheduleLabel = Label(viewTrainScheduleWindow2, text= "View Train Schedule")
        viewTrainScheduleLabel.grid(row=1, column=1, sticky=W+E)


        viewTrainScheduleLabel = Label(viewTrainScheduleWindow2, text="Schedule TABLE")
        viewTrainScheduleLabel.grid(row=2, column=1, sticky=W+E)

        #root = Tk()

        # tree = ttk.Treeview(root, column=("first", "second", "third", "fourth"))

        # tree.column("first", width = 100, anchor = "center")
        # tree.column("second", width = 100, anchor = "center")
        # tree.column("third", width = 100, anchor = "center")
        # tree.column("fourth", width = 100, anchor = "center")
        # tree.heading("first", text = "Train")
        # tree.heading("second", text = "Arrival Time")
        # tree.heading("third", text = "Departure Time")
        # tree.heading("fourth", text = "Station")
        # tree.pack()
        #viewTrainScheduleTree.insert("first", text = "Train")

        backButton = Button(viewTrainScheduleWindow2, text="Back", command=self.backButtonClicked)
        backButton.grid(row=3, column=1)

    def backButtonClicked(self):

        self.createViewTrainScheduleWindow
        self.buildViewTrainScheduleWindow(self.viewTrainScheduleWindow)
        self.viewTrainScheduleWindow2.withdraw()



