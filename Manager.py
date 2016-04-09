from tkinter import *
import pymysql
from tkinter import ttk
from tkinter import messagebox
class Manager(object):

    def __init__(self, username):
        # self.username = username
        # self.db = self.connect()
        # self.cursor = self.db.cursor()
        # self.cursor.execute("SELECT username FROM User WHERE username = %s", self.username)
        # self.email = self.cursor.fetchone()[0]

        # Manager's Menu - Choose Functionality
        # Create function will create a window and pass this window to build function.
        # After that the window will set into a mainloop().
        self.createChooseFunctionalityWindow()
        self.buildChooseFunctionalityWindow(self.chooseFunctionalityWindow)
        self.chooseFunctionalityWindow.mainloop()

##  =======Choose Functionality Window=======

    def createChooseFunctionalityWindow(self):
        self.chooseFunctionalityWindow = Tk()
        self.chooseFunctionalityWindow.title("Train Sales System")

    def buildChooseFunctionalityWindow(self, chooseFunctionalityWindow):
        # Add components to window

        # Choose Functionality Label
        chooseFunctionalityLabel = Label(chooseFunctionalityWindow, text = "chooseFunctionalityWindow")
        chooseFunctionalityLabel.grid(row=1, column=1, sticky=W+E)

        # View Revenue Report Label
        viewRevenueReportLabel = Label(chooseFunctionalityWindow, text = "View revenue report")
        viewRevenueReportLabel.grid(row=2, column=1)
        viewRevenueReportLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowViewRevenueReportLabelClicked)

        # View Popular Route Report
        viewPopularRouteReportLabel = Label(chooseFunctionalityWindow, text = "View popular route report")
        viewPopularRouteReportLabel.grid(row=3, column=1)
        viewPopularRouteReportLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowViewPopularRouteReportLabelClicked)

        # Log Out Button
        logOutButton = Button(chooseFunctionalityWindow, text="Log out", command=self.chooseFunctionalityWindowLogOutButtonClicked)
        logOutButton.grid(row=8, column=2, sticky=E)


##  ----------Choose Functionality Window Events----------
    def chooseFunctionalityWindowViewRevenueReportLabelClicked(self, event):
        # When click the ViewRevenueReportLabel in ChooseFunctionalityWindow,
        # it will invoke the createViewRevenueReportWindow() and buildRevenueReportWindow();
        # and hide chooseFunctionalityWindow.
        self.createViewRevenueReportWindow()
        self.buildViewRevenueReportWindow(self.viewRevenueReportWindow)
        self.chooseFunctionalityWindow.withdraw()

    def chooseFunctionalityWindowViewPopularRouteReportLabelClicked(self, event):
        # When click the ViewPopularRouteReportLabel in ChooseFunctionalityWindow,
        # it will invoke the createViewPopularRouteReportWindow() and buildViewPopularRouteReportWindow();
        # and hide chooseFunctionalityWindow.
        self.createViewPopularRouteReportWindow()
        self.buildViewPopularRouteReportWindow(self.viewPopularRouteReportWindow)
        self.chooseFunctionalityWindow.withdraw()

    def chooseFunctionalityWindowLogOutButtonClicked(self):
        # When click logOutButton in chooseFunctionalityWindow,
        # it will destroy chooseFunctionalityWindow and display Login Window
        self.chooseFunctionalityWindow.destroy()
        self.loginWindow.deiconify()

#=========View Revenue Report Window============

    def createViewRevenueReportWindow(self):
        self.viewRevenueReportWindow = Toplevel()
        self.viewRevenueReportWindow.title("Train Sales System")

    def buildViewRevenueReportWindow(self, viewRevenueReportWindow):
        # Add components to window

        # View Revenue Report Label
        viewRevenueReportLabel = Label(viewRevenueReportWindow, text="View Revenue Report")
        viewRevenueReportLabel.grid(row=1, column=1, sticky=W+E)

        # Build the form
        viewRevenueReportTree = ttk.Treeview(viewRevenueReportWindow, column=("1", "2"), height=2)
        viewRevenueReportTree.column("1", width=150, anchor="center")
        viewRevenueReportTree.column("2", width=150, anchor="center")
        viewRevenueReportTree.heading("1", text="Month")
        viewRevenueReportTree.heading("2", text="Revenue")

        for i in range(2):
            viewRevenueReportTree.insert('', i, values=('a'+str(i),'b'+str(i)))

        viewRevenueReportTree.grid(row=2,column=1,columnspan=3)

        # Back Button
        backButton = Button(viewRevenueReportWindow, text="Back", command=self.viewRevenueReportWindowBackButtonClicked)
        backButton.grid(row=4, column=1)

##  ----------View Revenue Report Window Events----------
    def viewRevenueReportWindowBackButtonClicked(self):
        # When click backButton destroy viewRevenueReportWindow
        # and display ChooseFunctionalityWindow
        self.viewRevenueReportWindow.destroy()
        self.chooseFunctionalityWindow.deiconify()

#=========View Popular Route Report Window============

    def createViewPopularRouteReportWindow(self):
        self.viewPopularRouteReportWindow = Toplevel()
        self.viewPopularRouteReportWindow.title("Train Sales System")

    def buildViewPopularRouteReportWindow(self, viewPopularRouteReportWindow):
        # Add components to window

        # View Popular Route Report Label
        viewPopularRouteReportLabel = Label(viewPopularRouteReportWindow, text="View Popular Route Report")
        viewPopularRouteReportLabel.grid(row=1, column=1, sticky=W+E)

        # Build the form
        viewPopularRouteReportTree = ttk.Treeview(viewPopularRouteReportWindow, column=("1", "2", "3"), height=2)
        viewPopularRouteReportTree.column("1", width=150, anchor="center")
        viewPopularRouteReportTree.column("2", width=150, anchor="center")
        viewPopularRouteReportTree.column("3", width=150, anchor="center")
        viewPopularRouteReportTree.heading("1", text="Month")
        viewPopularRouteReportTree.heading("2", text="Train Number")
        viewPopularRouteReportTree.heading("3", text="# of Reservations")

        for i in range(2):
            viewPopularRouteReportTree.insert('', i, values=('a'+str(i),'b'+str(i),'c'+str(i)))

        viewPopularRouteReportTree.grid(row=2, column=1, columnspan=3)



        # Back Button
        backButton = Button(viewPopularRouteReportWindow, text="Back", command=self.viewPopularRouteReportWindowBackButtonClicked)
        backButton.grid(row=4, column=1)


##  ----------View Popular Route Report Window Events----------
    def viewPopularRouteReportWindowBackButtonClicked(self):
        # When click backButton destroy viewPopularRouteReportWindow
        # and display ChooseFunctionalityWindow
        self.viewPopularRouteReportWindow.destroy()
        self.chooseFunctionalityWindow.deiconify()




#---------------------------------BACK BUTTON ASSOCIATED METHODS------------------------
    def backFromDisplayReportWindowToManagerMenu(self):
        self.displayReportWindow.withdraw()
        self.ManagerMenuWindow.deiconify()

    def backToSearchCriteriaWindow(self):
        self.generateReportWindow.withdraw()
        self.displayReportWindow.deiconify()

#------------------------HELPER METHODS----------------------------------------------

    def restaurantNameSelected(self, event):
        self.restaurantNameChoice.get()

    def generateRestaurantID(self):
        restaurantID = random.getrandbits(9);
        result = self.cursor.execute("SELECT rid FROM restaurant WHERE rid = %s", restaurantID)

        while result:
            restaurantID = random.getrandbits(9);
        return restaurantID

    def createAnEntry(self, rowNumber, columnNumber, widthNumber, window):
        aStringVar = StringVar()
        anEntry = Entry(window, textvariable = aStringVar, width = widthNumber)
        anEntry.grid(row = rowNumber, column = columnNumber, sticky = W + E)
        return aStringVar, anEntry

    def connect(self):
        try:
            db = pymysql.connect(host = 'academic-mysql.cc.gatech.edu',
                                 db = 'cs4400_Group_24', user = 'cs4400_Group_24', passwd = 'jGZgXJfO')
            return db
        except:
            messagebox.showwarning('Error!','Cannot connect. Please check your internet connection.')
            return False


a = Manager('test')

