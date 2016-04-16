from tkinter import *
import pymysql
from tkinter import messagebox
from tkinter import ttk

class GTTrain:
    def __init__(self):
        #调用createLoginWindow；调用buildLoginWindow；把loginWindow设为主循环
        #Connect to the database
        self.db = self.connect()
        self.cursor = self.db.cursor()
        # Login Window
        self.createLoginWindow()
        self.buildLoginWindow(self.loginWindow)
        self.loginWindow.mainloop()


##  =======Login Window=======


    def createLoginWindow(self):
        #创建空白的Login Window
        self.loginWindow = Tk()
        self.loginWindow.title("Train Sales System")

    def buildLoginWindow(self, loginWindow):
        #为Login Window添加组件
        # Login Label
        loginLabel = Label(loginWindow, text="Login")
        loginLabel.grid(row=1, column=3, sticky=W)

        # Username Label
        usernameLabel = Label(loginWindow, text="Username")
        usernameLabel.grid(row=2, column=2, sticky=W)

        # Password Label
        passwordLabel = Label(loginWindow, text="Password")
        passwordLabel.grid(row=4, column=2, sticky=W)


        # Username Entry
        self.username = StringVar()
        usernameEntry = Entry(loginWindow, textvariable=self.username, width=20)
        usernameEntry.grid(row=2, column=3, sticky=W + E)


        # Password Entry
        self.password = StringVar()
        passwordEntry = Entry(loginWindow, textvariable=self.password, show = '*', width=20)
        passwordEntry.grid(row=4, column=3, sticky=W + E)

        #Login Buttons
        loginButton = Button(loginWindow, text="Login", command=self.loginWindowLoginButtonClicked)
        loginButton.grid(row=6, column=3)

        #Register Button

        registerButton = Button(loginWindow, text="Register", command=self.loginWindowRegisterButtonClicked)
        registerButton.grid(row=6, column=4, sticky=E)


    def loginWindowLoginButtonClicked(self):
        # Click the button on Login Window:
        # Obtain the username and password from keypress;
        # Invoke;
        # Invoke;
        # Withdraw Login Window;
        username = self.username.get()
        password = self.password.get()
        if not username:
            messagebox.showwarning("Username input is empty", "Please enter username.")
            return False
        if not password:
            messagebox.showwarning("Password input is empty", "Please enter password")
            return False
        isUsername = self.cursor.execute("SELECT * FROM User WHERE Username = %s", username)
        if not isUsername:
           messagebox.showwarning("Username is not an user\'s username",
                                  "The username you entered is not an user\'s username.")
           return False
        usernameAndPasswordMatch = self.cursor.execute(
           "SELECT * FROM User WHERE (Username = %s AND Password = %s)", (username, password))
        print(usernameAndPasswordMatch)
        if not usernameAndPasswordMatch:
           messagebox.showwarning("Username and password don\'t match", "Sorry, the username and password you entered"
                                                                        + " do not match.")
           return False

        self.loginWindow.withdraw()
        self.createChooseFunctionalityWindowManager()
        self.buildChooseFunctionalityWindowManager(self.chooseFunctionalityWindowManager)
        return True

    def loginWindowRegisterButtonClicked(self):
        #点击Login Window上的Register Button时：
        #调用createNewUserRegistrationWindow；调用buildNewUserRegistrationWindow；
        #隐藏Login Window；把newUserRegistrationWindow置于顶层
        self.createNewUserRegistrationWindow()
        self.buildNewUserRegistrationWindow(self.newUserRegistrationWindow)
        self.loginWindow.withdraw()

#======New User Registration Window==============


    def createNewUserRegistrationWindow(self):
        #创建空白的newUserRegistrationWindow
        self.newUserRegistrationWindow = Toplevel()
        self.newUserRegistrationWindow.title("Train Sales System")



    def buildNewUserRegistrationWindow(self,newUserRegistrationWindow):
        #为newUserRegistrationWindow添加组件

        # New User Rigestration Label
        newUserRegistrationLabel = Label(newUserRegistrationWindow, text="New User Registration")
        newUserRegistrationLabel.grid(row=1, column=3, sticky=W)


        # Username Label
        usernameLabel = Label(newUserRegistrationWindow, text="Username")
        usernameLabel.grid(row=2, column=2, sticky=W)


        # Email Address Label
        emailAddressLabel = Label(newUserRegistrationWindow, text="Email Address")
        emailAddressLabel.grid(row=3, column=2, sticky=W)

        # Password Label
        passwordLabel = Label(newUserRegistrationWindow, text="Password")
        passwordLabel.grid(row=4, column=2, sticky=W)

        # Confirm Password Label
        confirmPasswordLabel = Label(newUserRegistrationWindow, text="Confirm Password")
        confirmPasswordLabel.grid(row=5, column=2, sticky=W)


        # Username Entry
        self.username = StringVar()
        usernameEntry = Entry(newUserRegistrationWindow, textvariable=self.username, width=20)
        usernameEntry.grid(row=2, column=3, sticky=W + E)


        # Email Address Entry
        self.emailAddress = StringVar()
        emailAddressEntry = Entry(newUserRegistrationWindow, textvariable=self.password,width=20)
        emailAddressEntry.grid(row=3, column=3, sticky=W + E)

        # Password Entry
        self.password = StringVar()
        passwordEntry = Entry(newUserRegistrationWindow, textvariable=self.username,show = '*',width=20)
        passwordEntry.grid(row=4, column=3, sticky=W + E)

        # Confirm Password Entry
        self.confirmPassword = StringVar()
        confirmPasswordEntry = Entry(newUserRegistrationWindow, textvariable=self.username,show = '*',width=20)
        confirmPasswordEntry.grid(row=5, column=3, sticky=W + E)


        #Create Button
        createButton = Button(newUserRegistrationWindow, text="Create", command=self.newUserRegistrationWindowCreateButtonClicked)
        createButton.grid(row=6, column=3)

    def newUserRegistrationWindowCreateButtonClicked(self):
        #点击New User Registration Window上的Create Button时：
        #调用createChooseFunctionalityWindow；调用buildChooseFunctionalityWindow；
        #消灭New User Registration Window（因为不会再用了）

        self.createChooseFunctionalityWindow()
        self.buildChooseFunctionalityWindow(self.chooseFunctionalityWindow)
        self.newUserRegistrationWindow.destroy()

##==========Choose Functionality Window================

    def createChooseFunctionalityWindow(self):
        #创建空白的chooseFunctionalityWindow
        self.chooseFunctionalityWindow = Toplevel()
        self.chooseFunctionalityWindow.title("Train Sales System")

    def buildChooseFunctionalityWindow(self,chooseFunctionalityWindow):
        #为chooseFunctionalityWindow添加组件

        #Choose Functionality Label
        chooseFunctionalityLabel = Label(chooseFunctionalityWindow, text="Choose Functionality")
        chooseFunctionalityLabel.grid(row=1, column=1, sticky=W+E)

        #View Train Schedule Label
        viewTrainScheduleLabel = Label(chooseFunctionalityWindow, text="View Train Schedule")
        viewTrainScheduleLabel.grid(row=2, column=1)
        viewTrainScheduleLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowViewTrainScheduleLabelClicked)

        #Make a New Reservation Label
        makeANewReservationLabel = Label(chooseFunctionalityWindow, text="Make a New Reservation")
        makeANewReservationLabel.grid(row=3, column=1)
        makeANewReservationLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowMakeANewReservationLabelClicked)


        #Update a Reservation Label
        updateAReservationLabel = Label(chooseFunctionalityWindow, text="Update a Reservation")
        updateAReservationLabel.grid(row=4,column=1)
        updateAReservationLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowUpdateAReservationLabelClicked)

        #Cancel a Reservation Label
        cancelAReservationLabel = Label(chooseFunctionalityWindow, text="Cancel a Reservation")
        cancelAReservationLabel.grid(row=5,column=1)
        cancelAReservationLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowCancelAReservationLabelClicked)


        #View Review Label
        viewReviewLabel = Label(chooseFunctionalityWindow, text="View Review")
        viewReviewLabel.grid(row=6,column=1)
        viewReviewLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowViewReviewLabelClicked)

        #Give Review Label
        giveReviewLabel = Label(chooseFunctionalityWindow, text="Give Review")
        giveReviewLabel.grid(row=7,column=1)
        giveReviewLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowGiveReviewLabelClicked)


        #Add School Information (Student Discount) Label
        addSchoolInformationStudentDiscountLabel = Label(chooseFunctionalityWindow, text="Add School Information (Student Discount)")
        addSchoolInformationStudentDiscountLabel.grid(row=8,column=1)
        addSchoolInformationStudentDiscountLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowAddSchoolInformationStudentDiscountLabelClicked)

        #Log Out Buttons

        logOutButton = Button(chooseFunctionalityWindow, text="Log out", command=self.chooseFunctionalityWindowLogOutButtonClicked)
        logOutButton.grid(row=8, column=2,sticky=E)

    def chooseFunctionalityWindowViewTrainScheduleLabelClicked(self,event):
        #点击Choose Functionality Window上的ViewTrainSchedule Label时：
        #调用createViewTrainScheduleWindow()；调用buildViewTrainScheduleWindow()；
        #隐藏Choose Functionality Window
        self.createViewTrainScheduleWindow()
        self.buildViewTrainScheduleWindow(self.viewTrainScheduleWindow)
        self.chooseFunctionalityWindow.withdraw()


    def chooseFunctionalityWindowMakeANewReservationLabelClicked(self,event):
        #点击Choose Functionality Window上的MakeANewReservation Label时：
        #调用createSearchTrainWindow()；调用buildSearchTrainWindow()；
        #隐藏Choose Functionality Window
        self.createSearchTrainWindow()
        self.buildSearchTrainWindow(self.searchTrainWindow)
        self.chooseFunctionalityWindow.withdraw()

    def chooseFunctionalityWindowUpdateAReservationLabelClicked(self,event):
        self.chooseFunctionalityWindow.withdraw()
        self.createUpdateReservationWindow()
        self.buildUpdateReservationWindow(self.updateReservationWindow)

    def chooseFunctionalityWindowCancelAReservationLabelClicked(self,event):
        self.createCancelReservationWindow1()
        self.buildCancelReservationWindow1(self.cancelReservationWindow1)
        self.chooseFunctionalityWindow.withdraw()

    def chooseFunctionalityWindowViewReviewLabelClicked(self,event):
        self.chooseFunctionalityWindow.withdraw()
        self.createViewReviewWindow()
        self.buildViewReviewWindow(self.viewReviewWindow)

    def chooseFunctionalityWindowGiveReviewLabelClicked(self,event):
        self.chooseFunctionalityWindow.withdraw()
        self.createGiveReviewWindow()
        self.buildGiveReviewWindow(self.giveReviewWindow)

    def chooseFunctionalityWindowAddSchoolInformationStudentDiscountLabelClicked(self,event):
        #点击Choose Functionality Window上的Add School Information (下略) Label时：
        #调用createAddSchoolInfoWindow()；调用buildAddSchoolWindow()；
        #隐藏Choose Functionality Window
        self.createAddSchoolInfoWindow()
        self.buildAddSchoolInfoWindow(self.addSchoolInfoWindow)
        self.chooseFunctionalityWindow.withdraw()

    def chooseFunctionalityWindowLogOutButtonClicked(self):
        #点击Choose Functionality Window上的Log Out Button时：
        #消灭Choose Functionality Window
        #显示Login Window
        self.chooseFunctionalityWindow.destroy()
        self.loginWindow.deiconify()

#=========View Train Schedule Window============

#这个应该叫createViewTrainScheduleWindow1来着……不过后面应该用不上所以暂时不管了

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
        searchButton = Button(viewTrainScheduleWindow, text="Search", command=self.viewTrainScheduleSearchButtonClicked)
        searchButton.grid(row=3, column=1)


    def viewTrainScheduleSearchButtonClicked(self):
        #点击Search Button时创建View Train Schedule Window 2消灭当前窗口
        self.createViewTrainScheduleWindow2()
        self.bulidViewTrainScheduleWindow2(self.viewTrainScheduleWindow2)
        self.viewTrainScheduleWindow.destroy()

#=============View Train Schedule Window 2=============

    def createViewTrainScheduleWindow2(self):
        self.viewTrainScheduleWindow2 = Toplevel()
        self.viewTrainScheduleWindow2.title("Train Sales System")

    def bulidViewTrainScheduleWindow2(self,viewTrainScheduleWindow2):
        #Label
        viewTrainScheduleLabel = Label(viewTrainScheduleWindow2, text= "View Train Schedule")
        viewTrainScheduleLabel.grid(row=1, column=1, sticky=W+E)
        scheduleTableLabel = Label(viewTrainScheduleWindow2, text="Schedule TABLE")
        scheduleTableLabel.grid(row=2, column=1, sticky=W+E)

        #build the form
        tree = ttk.Treeview(viewTrainScheduleWindow2, column=("First", "Second", "Third", "Fourth"))
        tree.column("First", width = 150, anchor = "center")
        tree.column("Second", width = 100, anchor = "center")
        tree.column("Third", width = 100, anchor = "center")
        tree.column("Fourth", width = 100, anchor = "center")
        tree.heading("First", text = "Train (Train Number)")
        tree.heading("Second", text = "Arrival Time")
        tree.heading("Third", text = "Departure Time")
        tree.heading("Fourth", text = "Station")

        #insert data into the form
        for i in range(10):
            tree.insert('',i,values=('a'+str(i),'b'+str(i),'c'+str(i),'d'+str(i)))

        tree.grid(row=3,column=1)

        #Button
        backButton = Button(viewTrainScheduleWindow2, text="Back", command=self.viewTrainScheduleWindow2BackButtonClicked)
        backButton.grid(row=4, column=1)

    def viewTrainScheduleWindow2BackButtonClicked(self):
        #点击Back时消灭当前窗口显示Choose Functionality Window
        self.viewTrainScheduleWindow2.destroy()
        self.chooseFunctionalityWindow.deiconify()

#=========Add School Info Window============

    def createAddSchoolInfoWindow(self):
        #创建空白的Add School Info Window
        self.addSchoolInfoWindow = Toplevel()
        self.addSchoolInfoWindow.title("Train Sales System")

    def buildAddSchoolInfoWindow(self,addSchoolInfoWindow):
        #给Add School Info Window添加组件

        #Add School Info Label
        addSchoolInfoLabel = Label(addSchoolInfoWindow, text="Add School Info")
        addSchoolInfoLabel.grid(row=1, column=1, sticky=W+E)

        #School Email Address
        schoolEmailAddressLabel = Label(addSchoolInfoWindow, text="School Email Address")
        schoolEmailAddressLabel.grid(row=2, column=1, sticky=W)

        #Your School Label
        yourSchoolLabel =  Label(addSchoolInfoWindow,text=" Your school email address ends with edu.")
        yourSchoolLabel.grid(row=3, column=1, sticky=W)

        #School Email Entry
        self.schoolEmailAddress = StringVar()
        schoolEmailAddressEntry = Entry(addSchoolInfoWindow, textvariable=self.schoolEmailAddress, width=20)
        schoolEmailAddressEntry.grid(row=2, column=2, sticky=E)

        #Back Button
        backButton = Button(addSchoolInfoWindow, text="Back", command=self.addSchoolInfoWindowBackButtonClicked)
        backButton.grid(row=4, column=1)

        #Submit Button
        submitButton = Button(addSchoolInfoWindow, text="Submit", command=self.addSchoolInfoWindowSubmitButtonClicked)
        submitButton.grid(row=4, column=2,sticky=E)


    def addSchoolInfoWindowBackButtonClicked(self):
        #点击Add School Info Window上的Back Button时：
        #消灭Add School Info Window
        #显示Choose Functionality Window
        self.addSchoolInfoWindow.destroy()
        self.chooseFunctionalityWindow.deiconify()


    def addSchoolInfoWindowSubmitButtonClicked(self):
        #点击Add School Info Window上的Submit Button时：
        #消灭Add School Info Window
        #显示Choose Functionality Window
        self.addSchoolInfoWindow.destroy()
        self.chooseFunctionalityWindow.deiconify()


#=========Search Train Window============

    def createSearchTrainWindow(self):
        #创建空白的Search Train Window
        self.searchTrainWindow=Toplevel()
        self.searchTrainWindow.title("Train Sales System")

    def buildSearchTrainWindow(self,searchTrainWindow):

        # Title Label
        titleLabel= Label(searchTrainWindow,text = "Search Train")
        titleLabel.grid(row=1,column=2,sticky=W+E)

        # Labels
        departsFromLabel= Label(searchTrainWindow,text = "Departs From")
        departsFromLabel.grid(row=2,column=1)
        arrivesAtLabel= Label(searchTrainWindow,text = "Arrives At")
        arrivesAtLabel.grid(row=3,column=1)
        departureDateLabel= Label(searchTrainWindow,text = "Departure Date")
        departureDateLabel.grid(row=4,column=1)

        # Button
        findTrainsButton = Button(searchTrainWindow, text="Find Trains", command=self.searchTrainWindowFindTrainsButtonClicked)
        findTrainsButton.grid(row=5,column=3)

        #drop down menu
        departsFromDate=StringVar(searchTrainWindow)

        #get stops informatin from the database. Below names are for demos only.

        departsFromDate.set("Boston(BBY)")
        departsFrom = OptionMenu(searchTrainWindow, departsFromDate, "Boston(BBY)","New York", "Atlanta", "LA")
        departsFrom.grid(row=2,column=2)
        arrivesAtDate=StringVar(searchTrainWindow)
        arrivesAtDate.set("New York(Penn Station)")
        arrivesAt = OptionMenu(searchTrainWindow, arrivesAtDate, "New York(Penn Station)","Boston(BBY)", "Atlanta", "LA")
        arrivesAt.grid(row=3,column=2)

        #save a space for the calender
        calenderLabel= Label(searchTrainWindow,text = "Deperature Date")
        calenderLabel.grid(row=4,column=2)

    def searchTrainWindowFindTrainsButtonClicked(self):

        #点击Search Train Window上的Find Train Button时：
        #消灭Search Train Window
        #显示Select Departure Window
        self.searchTrainWindow.destroy()
        self.createSelectDepartureWindow()
        self.buildSelectDepartureWindow(self.selectDepartureWindow)

  #=========Select Departure Window============

    def createSelectDepartureWindow(self):
        self.selectDepartureWindow = Toplevel()
        self.selectDepartureWindow.title("Train Sales System")


    def buildSelectDepartureWindow(self,selectDepartureWindow):
        #Label
        departureLabel = Label(selectDepartureWindow, text = "Select Departure")
        departureLabel.grid(row=1, column=1, sticky= W+E)


        #build the form
        #need to add radio button
        #价格从高到低排列


        #...不知道为啥多出一列空的
        tree = ttk.Treeview(selectDepartureWindow, column=("First", "Second", "Third", "Fourth"))
        tree.column("First", width = 150, anchor = "center")
        tree.column("Second", width = 150, anchor = "center")
        tree.column("Third", width = 150, anchor = "center")
        tree.column("Fourth", width = 150, anchor = "center")
        tree.heading("First", text = "Train (Train Number)")
        tree.heading("Second", text = "Time (Duration)")
        tree.heading("Third", text = "1st Class Price")
        tree.heading("Fourth", text = "2nd Class Price")

        #insert data into the form
        for i in range(10):
            tree.insert('',i,values=('a'+str(i),'b'+str(i),'c'+str(i),'d'+str(i)))

        tree.grid(row=2,column=1)

        #Buttons
        backButton = Button(selectDepartureWindow, text="Back", command=self.selectDepartureBackButtonClicked)
        backButton.grid(row=3, column=1)

        nextButton = Button(selectDepartureWindow, text="Next", command=self.selectDepartureNextButtonClicked)
        nextButton.grid(row=3, column=2)


    def selectDepartureBackButtonClicked(self):
        self.selectDepartureWindow.destroy()
        self.chooseFunctionalityWindow.deiconify()


    def selectDepartureNextButtonClicked(self):
        self.selectDepartureWindow.destroy()
        self.createTravelExtrasPassengerInfoWindow()
        self.buildTravelExtrasPassengerInfoWindow(self.travelExtrasPassengerInfoWindow)

 #=========Travel Extras & Passenger Window============


    def createTravelExtrasPassengerInfoWindow(self):
        self.travelExtrasPassengerInfoWindow =Toplevel()
        self.travelExtrasPassengerInfoWindow.title("Train Sales System")

    def buildTravelExtrasPassengerInfoWindow(self,travelExtrasPassengerInfoWindow):
        #Title Label
        titleLabel= Label(travelExtrasPassengerInfoWindow,text = "Travel Extras & Passenger Info")
        titleLabel.grid(row=1,column=1,sticky=W+E)

        #Labels
        numberOfBaggageLabel= Label(travelExtrasPassengerInfoWindow,text = "Number of Baggage")
        numberOfBaggageLabel.grid(row=2,column=1)
        textLabel=Label(travelExtrasPassengerInfoWindow,text = "Every passenger can bring up to 4 baggage 2 free of charge, 2 for $30 per bag.")
        textLabel.grid(row=3,column=1)
        passergenNameLabel= Label(travelExtrasPassengerInfoWindow,text = "passergen Name")
        passergenNameLabel.grid(row=4,column=1)

        #Entry
        self.passengerName = StringVar()
        passengerNameEntry = Entry(travelExtrasPassengerInfoWindow, textvariable=self.passengerName,width=20)
        passengerNameEntry.grid(row=4, column=2)

        #drop down menu
        numberOfBaggage=StringVar(travelExtrasPassengerInfoWindow)
        numberOfBaggage.set("1")
        numberOfBaggage = OptionMenu(travelExtrasPassengerInfoWindow, numberOfBaggage, "1","2", "3", "4")
        numberOfBaggage.grid(row=2,column=2)

        #Buttons
        travelExtrasPassengerInfoWindowBackButton = Button(travelExtrasPassengerInfoWindow, text="Back", command=self.travelExtrasPassengerInfoWindowBackButtonClicked)
        travelExtrasPassengerInfoWindowBackButton.grid(row=5, column=1)
        travelExtrasPassengerInfoWindowNextButton = Button(travelExtrasPassengerInfoWindow, text="Next", command=self.travelExtrasPassengerInfoWindowNextButtonClicked)
        travelExtrasPassengerInfoWindowNextButton.grid(row=5, column=3)


    def travelExtrasPassengerInfoWindowBackButtonClicked(self):
        self.travelExtrasPassengerInfoWindow.destroy()
        self.createSelectDepartureWindow()
        self.buildSelectDepartureWindow(self.selectDepartureWindow)

    def travelExtrasPassengerInfoWindowNextButtonClicked(self):
        self.travelExtrasPassengerInfoWindow.destroy()
        self.createMakeReservationWindow()
        self.buildMakeReservationWindow(self.makeReservationWindow)

 #=========Make Reservation Window============

    def createMakeReservationWindow(self):

        self.makeReservationWindow =Toplevel()
        self.makeReservationWindow.title("Train Sales System")


    def buildMakeReservationWindow(self, makeReservationWindow):
        #Title Label
        makeReservationLabel= Label(makeReservationWindow,text = "Make Reservation")
        makeReservationLabel.grid(row=1,column=1,sticky=W+E)

        #Labels
        currentlySelectedLabel= Label(makeReservationWindow,text = "Currently Selected")
        currentlySelectedLabel.grid(row=2,column=1,sticky=W)


        #build the form

        tree = ttk.Treeview(makeReservationWindow, column=("First", "Second", "Third", "Fourth", "5th", "6th" ,"7th", "8th","9th"))
        tree.column("First", width = 100, anchor = "center")
        tree.column("Second", width = 100, anchor = "center")
        tree.column("Third", width = 100, anchor = "center")
        tree.column("Fourth", width = 100, anchor = "center")
        tree.column("5th", width = 100, anchor = "center")
        tree.column("6th", width = 100, anchor = "center")
        tree.column("7th", width = 100, anchor = "center")
        tree.column("8th", width = 100, anchor = "center")
        tree.column("9th", width = 100, anchor = "center")


        tree.heading("First", text = "Train (Train Number)")
        tree.heading("Second", text = "Time (Duration)")
        tree.heading("Third", text = "Departs From")
        tree.heading("Fourth", text = "Arrive At")
        tree.heading("5th", text = "Class")
        tree.heading("6th", text = "Price")
        tree.heading("7th", text = "# of Baggages")
        tree.heading("8th", text = "Passenger Name")
        tree.heading("9th", text = "Remove")


        #insert data into the form
        for i in range(10):
            tree.insert('',i, values=('a'+str(i),'b'+str(i),'c'+str(i),'d'+str(i),'e'+str(i),'f'+str(i),'g'+str(i),'h'+str(i),'i'+str(i)))

        tree.grid(row = 3,column =1,columnspan=3)

        #Labels
        studentDiscountAppliedLabel= Label(makeReservationWindow,text = "Student Discount Applied")
        studentDiscountAppliedLabel.grid(row=4, column=1,sticky=W)

        totalCostLabel= Label(makeReservationWindow,text = "Total Cost")
        totalCostLabel.grid(row=5, column=1,sticky=W)

        #Cost display Entry
        self.totalCost = StringVar()
        totalCostEntry = Entry(makeReservationWindow, textvariable = self.totalCost, width=10)
        totalCostEntry.grid(row=5, column=2,sticky=W)

        #Use Card Label
        useCardLabel= Label(makeReservationWindow,text = "Use Card")
        useCardLabel.grid(row=6, column=1,sticky=W)


        #drop down menu
        lastDigitOfCard = StringVar(makeReservationWindow)
        lastDigitOfCard.set("1111")
        lastDigitOfCard  = OptionMenu(makeReservationWindow, lastDigitOfCard, "2222", "3333", "4444")
        lastDigitOfCard.grid(row = 6, column = 2,sticky=W)

        #Add Card Label
        addCardLabel = Label(makeReservationWindow, text="Add Card")
        addCardLabel.grid(row = 6, column = 3,sticky=W)
        addCardLabel.bind("<ButtonPress-1>", self.makeReservationWindowAddCardLabelClicked)


        #Continue adding a train Label
        continueAddingATrainLabel = Label(makeReservationWindow, text="Continue adding a train")
        continueAddingATrainLabel.grid(row = 7, column = 1,sticky=W)
        continueAddingATrainLabel.bind("<ButtonPress-1>", self.makeReservationWindowContinueAddingATrainLabelClicked)


        #Buttons
        makeReservationWindowBackButton = Button(makeReservationWindow, text="Back", command=self.makeReservationWindowBackButtonClicked)
        makeReservationWindowBackButton.grid(row=8, column=1,sticky=W)

        makeReservationWindowSumbitButton = Button(makeReservationWindow, text="Submit", command=self.makeReservationWindowSubmitButtonClicked)
        makeReservationWindowSumbitButton.grid(row=8, column=2,sticky=W)


    def makeReservationWindowAddCardLabelClicked(self,event):
        self.createPaymentInfoWindow()
        self.buildPaymentInfoWindow(self.paymentInfoWindow)
        self.makeReservationWindow.destroy()

    def makeReservationWindowContinueAddingATrainLabelClicked(self,event):
        self.makeReservationWindow.withdraw()

        self.createSearchTrainWindow()
        self.buildSearchTrainWindow(self.searchTrainWindow)

    def makeReservationWindowBackButtonClicked(self):
        self.makeReservationWindow.destroy()
        self.createTravelExtrasPassengerInfoWindow()
        self.buildTravelExtrasPassengerInfoWindow(self.travelExtrasPassengerInfoWindow)

    def makeReservationWindowSubmitButtonClicked(self):
        self.makeReservationWindow.withdraw()
        self.createConfirmationWindow()
        self.buildConfirmationWindow(self.confirmationWindow)



 #=========Payment Infomation Window============

    def createPaymentInfoWindow(self):
        self.paymentInfoWindow =Toplevel()
        self.paymentInfoWindow.title("Train Sales System")


    def buildPaymentInfoWindow(self, paymentInfoWindow):

        # Labels
        paymentInfoLabel = Label(paymentInfoWindow, text = "Payment Information")
        paymentInfoLabel.grid(row=1, column=1, sticky = W + E)

        addCardLabel = Label(paymentInfoWindow, text = "Add Card")
        addCardLabel.grid(row=2, column=1, sticky = W)
        deleteCardLabel = Label(paymentInfoWindow, text = "Delete Card")
        deleteCardLabel.grid(row=2, column=4, sticky= E)
        nameOnCardLabel = Label(paymentInfoWindow, text = "Name on Card")
        nameOnCardLabel.grid(row=3,column = 1, sticky=W)

        #Entrys
        self.nameOnCard = StringVar()
        nameOnCardEntry = Entry(paymentInfoWindow, textvariable=self.nameOnCard,width=10)
        nameOnCardEntry.grid(row=3, column=2)



        #delete card Labels
        deleteCardNumberLabel = Label(paymentInfoWindow, text = "Card Number")
        deleteCardNumberLabel.grid(row=3,column = 3, sticky=E)

        #drop down menu
        deleteLastDigitOfCard= StringVar(paymentInfoWindow)
        deleteLastDigitOfCard.set("1111")
        deleteLastDigitOfCard = OptionMenu(paymentInfoWindow, deleteLastDigitOfCard, "2222", "3333", "4444")
        deleteLastDigitOfCard.grid(row = 3, column = 4,sticky=E)

        #add card number Labels
        addCardNumberLabel = Label(paymentInfoWindow, text = "Card Number")
        addCardNumberLabel.grid(row=4,column = 1, sticky = W)

        #Entrys
        self.addCardNumber = StringVar()
        addCardNumberEntry = Entry(paymentInfoWindow, textvariable=self.addCardNumber,width=10)
        addCardNumberEntry.grid(row=4, column=2,sticky=W)

        #CVV Labels
        cvvLabel = Label(paymentInfoWindow, text = "CVV")
        cvvLabel.grid(row=5,column = 1, sticky=W)

        #CVV Entrys
        self.cvv = StringVar()
        cvvEntry = Entry(paymentInfoWindow, textvariable=self.cvv,width=20)
        cvvEntry.grid(row=5, column=2,sticky=W)

        #Expiration Date Label
        expirationDateLabel = Label(paymentInfoWindow, text = "Expiration Date")
        expirationDateLabel.grid(row=6,column = 1, sticky=W)

        #Expiration Date Entrys
        self.expirationDate = StringVar()
        expirationDateEntry = Entry(paymentInfoWindow, textvariable=self.expirationDate,width=20)
        expirationDateEntry.grid(row=6, column=2,sticky=W)


        #sumbit buttons
        paymentInfoWindowAddSubmitButton = Button(paymentInfoWindow, text="Submit", command=self.paymentInfoWindowAddSumbitButtonClicked)
        paymentInfoWindowAddSubmitButton.grid(row=7, column=1)
        paymentInfoWindowDeleteSubmitButton = Button(paymentInfoWindow, text="Sumbit", command=self.paymentInfoWindowDeleteSumbitButtonClicked)
        paymentInfoWindowDeleteSubmitButton.grid(row=7, column=3)


    def paymentInfoWindowAddSumbitButtonClicked(self):
        self.paymentInfoWindow.destroy()
        self.createMakeReservationWindow()
        self.buildMakeReservationWindow(self.makeReservationWindow)


    def paymentInfoWindowDeleteSumbitButtonClicked(self):
        self.paymentInfoWindow.destroy()
        self.createMakeReservationWindow()
        self.buildMakeReservationWindow(self.makeReservationWindow)


 #=========Confirmation Window============

    def createConfirmationWindow(self):

        self.confirmationWindow =Toplevel()
        self.confirmationWindow.title("Train Sales System")

    def buildConfirmationWindow(self, confirmationWindow):

         # Labels
        confirmationLabel = Label(confirmationWindow, text = "Confirmation")
        confirmationLabel.grid(row=1, column=1, sticky = W + E)

        reservationIDLabel = Label(confirmationWindow, text = "Reservation ID")
        reservationIDLabel.grid(row=2, column=1, sticky = W)

        #Reservation ID Entrys
        self.reservationId = StringVar()
        reservationIdEntry = Entry(confirmationWindow, textvariable=self.reservationId,width=20)
        reservationIdEntry.grid(row=2, column=2,sticky=W)

        # Thank you Labels
        thankYouLabel = Label(confirmationWindow, text = "Thank you for your purchase! Please save Reservation ID for your records.")
        thankYouLabel.grid(row=3, column=1, sticky = W + E)
        #back to choose functionality buttons
        confirmationWindowBackButton = Button(confirmationWindow, text="Go back to choose functionality", command=self.confirmationWindowBackButtonClicked)
        confirmationWindowBackButton.grid(row=4, column=1)

    def confirmationWindowBackButtonClicked(self):
        self.confirmationWindow.destroy()
        self.chooseFunctionalityWindow.deiconify()



#======Update Reservation Window======


    def createUpdateReservationWindow(self):
        self.updateReservationWindow =Toplevel()
        self.updateReservationWindow.title("Train Sales System")

    def buildUpdateReservationWindow(self,updateReservationWindow):

        #Update Reservation Label
        updateReservationLabel = Label(updateReservationWindow,text="Update Reservation")
        updateReservationLabel.grid(row=1, column=2, sticky=W+E)

        #Reservation ID Label
        reservationIDLabel = Label(updateReservationWindow,text="Reservation ID")
        reservationIDLabel.grid(row=2, column=1, sticky=W)

        #Reservation ID Entry
        self.reservationID = StringVar()
        reservationIDEntry = Entry(updateReservationWindow, textvariable=self.reservationID, width=10)
        reservationIDEntry.grid(row=2, column=2, sticky=W+E)

        #Search Button
        searchButton = Button(updateReservationWindow, text = "Search", command = self.updateReservationWindowSearchButtonClicked)
        searchButton.grid(row=2, column=3, sticky=W)

        #Back Button
        backButton = Button(updateReservationWindow, text = "Back", command = self.updateReservationWindowBackButtonClicked)
        backButton.grid(row=3, column=2, sticky=W)

    def updateReservationWindowSearchButtonClicked(self):
        self.updateReservationWindow.destroy()
        self.createUpdateReservationWindow2()
        self.buildUpdateReservationWindow2(self.updateReservationWindow2)

    def updateReservationWindowBackButtonClicked(self):
        self.updateReservationWindow.destroy()
        self.chooseFunctionalityWindow.deiconify()

#======Update Reservation Window 2===========


    def createUpdateReservationWindow2(self):
        self.updateReservationWindow2 =Toplevel()
        self.updateReservationWindow2.title("Train Sales System")

    def buildUpdateReservationWindow2(self,updateReservationWindow2):

        #Update Reservation Label
        updateReservationLabel = Label(updateReservationWindow2,text="Update Reservation")
        updateReservationLabel.grid(row=1, column=2, sticky=W+E)


        #Update Reservation Tree view
        updateReservationTree = ttk.Treeview(updateReservationWindow2, column=("1", "2", "3", "4","5","6","7","8","9"))
        updateReservationTree.column("1", width = 150, anchor = "center")
        updateReservationTree.column("2", width = 150, anchor = "center")
        updateReservationTree.column("3", width = 150, anchor = "center")
        updateReservationTree.column("4", width = 150, anchor = "center")
        updateReservationTree.column("5", width = 150, anchor = "center")
        updateReservationTree.column("6", width = 150, anchor = "center")
        updateReservationTree.column("7", width = 150, anchor = "center")
        updateReservationTree.column("8", width = 150, anchor = "center")
        updateReservationTree.column("9", width = 150, anchor = "center")
        updateReservationTree.heading("1", text = "Select")
        updateReservationTree.heading("2", text = "Train(Train Number)")
        updateReservationTree.heading("3", text = "Time(Duration)")
        updateReservationTree.heading("4", text = "Departs From")
        updateReservationTree.heading("5", text = "Arrives At")
        updateReservationTree.heading("6", text = "Class")
        updateReservationTree.heading("7", text = "Price")
        updateReservationTree.heading("8", text = "# of Baggage")
        updateReservationTree.heading("9", text = "Passenger Name")

        #insert data into the form
        for i in range(10):
            updateReservationTree.insert('',i,values=('a'+str(i),'b'+str(i),'c'+str(i),'d'+str(i),'e'+str(i),'f'+str(i),'g'+str(i),'h'+str(i),'j'+str(i)))

        updateReservationTree.grid(row=2,column=1,columnspan=3)

        #Next Button
        nextButton = Button(updateReservationWindow2, text = "Next", command = self.updateReservationWindow2NextButtonClicked)
        nextButton.grid(row=3, column=2, sticky=W+E)

        #Back Button
        backButton = Button(updateReservationWindow2, text = "Back", command = self.updateReservationWindow2BackButtonClicked)
        backButton.grid(row=3, column=1, sticky=W+E)

    def updateReservationWindow2NextButtonClicked(self):
        self.updateReservationWindow2.destroy()
        self.createUpdateReservationWindow3()
        self.buildUpdateReservationWindow3(self.updateReservationWindow3)

    def updateReservationWindow2BackButtonClicked(self):
        self.updateReservationWindow2.destroy()
        self.createUpdateReservationWindow()
        self.buildUpdateReservationWindow(self.updateReservationWindow)


#======Update Reservation Window 3===========


    def createUpdateReservationWindow3(self):
        self.updateReservationWindow3 = Toplevel()
        self.updateReservationWindow3.title("Train Sales System")

    def buildUpdateReservationWindow3(self,updateReservationWindow3):

        #Update Reservation Label
        updateReservationLabel = Label(updateReservationWindow3,text="Update Reservation")
        updateReservationLabel.grid(row=1, column=2, sticky=W+E)


        #Current Train Ticket Label
        currentTrainTicketLabel = Label(updateReservationWindow3,text="Current Train Ticket")
        currentTrainTicketLabel.grid(row=2, column=1, sticky=W+E)

        #Current Train Ticket Treeview
        currentTrainTicketTree = ttk.Treeview(updateReservationWindow3, column=("1", "2", "3", "4","5","6","7","8"),height=2)
        currentTrainTicketTree.column("1", width = 150, anchor = "center")
        currentTrainTicketTree.column("2", width = 150, anchor = "center")
        currentTrainTicketTree.column("3", width = 150, anchor = "center")
        currentTrainTicketTree.column("4", width = 150, anchor = "center")
        currentTrainTicketTree.column("5", width = 150, anchor = "center")
        currentTrainTicketTree.column("6", width = 150, anchor = "center")
        currentTrainTicketTree.column("7", width = 150, anchor = "center")
        currentTrainTicketTree.column("8", width = 150, anchor = "center")
        currentTrainTicketTree.heading("1", text = "Train(Train Number)")
        currentTrainTicketTree.heading("2", text = "Time(Duration)")
        currentTrainTicketTree.heading("3", text = "Departs From")
        currentTrainTicketTree.heading("4", text = "Arrives At")
        currentTrainTicketTree.heading("5", text = "Class")
        currentTrainTicketTree.heading("6", text = "Price")
        currentTrainTicketTree.heading("7", text = "# of Baggage")
        currentTrainTicketTree.heading("8", text = "Passenger Name")

        for i in range(2):
            currentTrainTicketTree.insert('',i,values=('a'+str(i),'b'+str(i),'c'+str(i),'d'+str(i),'e'+str(i),'f'+str(i),'g'+str(i),'h'+str(i)))

        currentTrainTicketTree.grid(row=2,column=1,columnspan=3)

        #New Departure Date Label
        newDepartureDateLabel = Label(updateReservationWindow3,text="New Departure Date")
        newDepartureDateLabel.grid(row=3, column=1, sticky=W+E)

        #Calendar Grid Label
        calendarGridLabel = Label(updateReservationWindow3,text="Calendar")
        calendarGridLabel.grid(row=3, column=2, sticky=W+E)

        #Search Availability Button
        searchAvailabilityButton = Button(updateReservationWindow3, text = "Search Availability")
        searchAvailabilityButton.grid(row=3, column=3, sticky=W+E)

        #Updated Train Ticket Label
        updatedTrainTicketLabel = Label(updateReservationWindow3,text="Updated Train Ticket")
        updatedTrainTicketLabel.grid(row=4, column=1, sticky=W+E)

        #Updated Train Ticket Treeview
        updatedTrainTicketTree = ttk.Treeview(updateReservationWindow3, column=("1", "2", "3", "4","5","6","7","8"), height=2)
        updatedTrainTicketTree.column("1", width = 150, anchor = "center")
        updatedTrainTicketTree.column("2", width = 150, anchor = "center")
        updatedTrainTicketTree.column("3", width = 150, anchor = "center")
        updatedTrainTicketTree.column("4", width = 150, anchor = "center")
        updatedTrainTicketTree.column("5", width = 150, anchor = "center")
        updatedTrainTicketTree.column("6", width = 150, anchor = "center")
        updatedTrainTicketTree.column("7", width = 150, anchor = "center")
        updatedTrainTicketTree.column("8", width = 150, anchor = "center")
        updatedTrainTicketTree.heading("1", text = "Train(Train Number)")
        updatedTrainTicketTree.heading("2", text = "Time(Duration)")
        updatedTrainTicketTree.heading("3", text = "Departs From")
        updatedTrainTicketTree.heading("4", text = "Arrives At")
        updatedTrainTicketTree.heading("5", text = "Class")
        updatedTrainTicketTree.heading("6", text = "Price")
        updatedTrainTicketTree.heading("7", text = "# of Baggage")
        updatedTrainTicketTree.heading("8", text = "Passenger Name")


        for i in range(2):
            updatedTrainTicketTree.insert('',i,values=('a'+str(i),'b'+str(i),'c'+str(i),'d'+str(i),'e'+str(i),'f'+str(i),'g'+str(i),'h'+str(i)))

        updatedTrainTicketTree.grid(row=5,column=1,columnspan=3)

        for i in range(2):
            updatedtTrainTicketTree.insert('',i,values=('a'+str(i),'b'+str(i),'c'+str(i),'d'+str(i),'e'+str(i),'f'+str(i),'g'+str(i),'h'+str(i)))

        updatedtTrainTicketTree.grid(row=5,column=1,columnspan=3)

        #Change Fee Label
        changeFeeLabel = Label(updateReservationWindow3,text="Change Fee")
        changeFeeLabel.grid(row=6, column=1, sticky=W+E)

        #Change Fee Entry
        self.changeFee = StringVar()
        self.changeFee.set("0")
        self.changeFeeEntry = Entry(updateReservationWindow3, textvariable=self.changeFee,width=10, state="readonly")
        self.changeFeeEntry.grid(row=6, column=2, sticky=W+E)

        #Updated Total Cost Label
        updatedTotalCostLabel = Label(updateReservationWindow3,text="Updated Total Cost")
        updatedTotalCostLabel.grid(row=7, column=1, sticky=W+E)

        #Updated Total Cost Entry
        self.updatedTotalCost = StringVar()
        self.updatedTotalCost.set("0")
        self.updatedTotalCostEntry = Entry(updateReservationWindow3, textvariable=self.updatedTotalCost,width=10, state="readonly")
        self.updatedTotalCostEntry.grid(row=7, column=2, sticky=W+E)

        #Back Button
        backButton = Button(updateReservationWindow3, text = "Back", command = self.updateReservationWindow3BackButtonClicked)
        backButton.grid(row=8, column=1, sticky=W+E)

        #Submit Button
        submitButton = Button(updateReservationWindow3, text = "Submit", command = self.updateReservationWindow3SubmitButtonClicked)
        submitButton.grid(row=8, column=2, sticky=W+E)

    def updateReservationWindow3BackButtonClicked(self):
        self.updateReservationWindow3.destroy()
        self.createUpdateReservationWindow2()
        self.buildUpdateReservationWindow2(self.updateReservationWindow2)

    def updateReservationWindow3SubmitButtonClicked(self):
        self.updateReservationWindow3.destroy()
        self.chooseFunctionalityWindow.deiconify()

#======Cancel Reservation Window 1===========


    def createCancelReservationWindow1(self):
        self.cancelReservationWindow1 = Toplevel()
        self.cancelReservationWindow1.title("Train Sales System")

    def buildCancelReservationWindow1(self,cancelReservationWindow1):

        # Add Components To Window

        # Cancel Reservation Label
        cancelReservationLabel = Label(cancelReservationWindow1,text="Cancel Reservation")
        cancelReservationLabel.grid(row=1, column=1, sticky=W+E)

        # Reservation ID Label
        reservationIDLabel = Label(cancelReservationWindow1,text="Reservation ID")
        reservationIDLabel.grid(row=1, column=1, sticky=W+E)

        # Reservation ID Entry
        self.reservationID = StringVar()
        reservationIDEntry = Entry(cancelReservationWindow1, textvariable=self.reservationID, width=10)
        reservationIDEntry.grid(row=1, column=2, sticky=W+E)

        # Search Button
        searchButton = Button(cancelReservationWindow1, text="Search", command=self.cancelReservationWindow1SearchButtonClicked)
        searchButton.grid(row=1, column=3)

        # Back Button
        backButton = Button(cancelReservationWindow1, text="Back", command=self.cancelReservationWindow1BackButtonClicked)
        backButton.grid(row=2, column=2)

    def cancelReservationWindow1SearchButtonClicked(self):
        self.cancelReservationWindow1.destroy()
        self.createCancelReservationWindow2()
        self.buildCancelReservationWindow2(self.cancelReservationWindow2)

    def cancelReservationWindow1BackButtonClicked(self):
        self.cancelReservationWindow1.destroy()
        self.createChooseFunctionalityWindow()
        self.buildChooseFunctionalityWindow(self.chooseFunctionalityWindow)

#======Cancel Reservation Window 2===========


    def createCancelReservationWindow2(self):
        self.cancelReservationWindow2 = Toplevel()
        self.cancelReservationWindow2.title("Train Sales System")

    def buildCancelReservationWindow2(self,cancelReservationWindow2):
        # Add Components To Window

        # Cancel Reservation Label
        cancelReservationLabel = Label(cancelReservationWindow2,text="Cancel Reservation")
        cancelReservationLabel.grid(row=1, column=2, sticky=W+E)

        # Cancel Reservation Treeview
        cancelReservationTree = ttk.Treeview(cancelReservationWindow2, column=("1", "2", "3", "4","5","6","7","8"), height=2)
        cancelReservationTree.column("1", width = 150, anchor = "center")
        cancelReservationTree.column("2", width = 150, anchor = "center")
        cancelReservationTree.column("3", width = 150, anchor = "center")
        cancelReservationTree.column("4", width = 150, anchor = "center")
        cancelReservationTree.column("5", width = 150, anchor = "center")
        cancelReservationTree.column("6", width = 150, anchor = "center")
        cancelReservationTree.column("7", width = 150, anchor = "center")
        cancelReservationTree.column("8", width = 150, anchor = "center")
        cancelReservationTree.heading("1", text = "Train(Train Number)")
        cancelReservationTree.heading("2", text = "Time(Duration)")
        cancelReservationTree.heading("3", text = "Departs From")
        cancelReservationTree.heading("4", text = "Arrives At")
        cancelReservationTree.heading("5", text = "Class")
        cancelReservationTree.heading("6", text = "Price")
        cancelReservationTree.heading("7", text = "# of Baggage")
        cancelReservationTree.heading("8", text = "Passenger Name")

        for i in range(2):
            cancelReservationTree.insert('',i,values=('a'+str(i),'b'+str(i),'c'+str(i),'d'+str(i),'e'+str(i),'f'+str(i),'g'+str(i),'h'+str(i)))

        cancelReservationTree.grid(row=2,column=1,columnspan=3)

        # Total Cost of Reservation Label
        totalCostOfReservationLabel = Label(cancelReservationWindow2,text="Total Cost of Reservation")
        totalCostOfReservationLabel.grid(row=3, column=1, sticky=W+E)

        # Date Of Cancellation Label
        dateOfCancellationLabel = Label(cancelReservationWindow2,text="Dare of Cancellation")
        dateOfCancellationLabel.grid(row=4, column=1, sticky=W+E)

        # Amount to be Refunded Label
        amountToBeRefundedLabel = Label(cancelReservationWindow2,text="Amount to be Refunded")
        amountToBeRefundedLabel.grid(row=5, column=1, sticky=W+E)

        # Total Cost of Reservation Entry
        self.totalCostOfReservation = StringVar()
        totalCostOfReservationEntry = Entry(cancelReservationWindow2, textvariable=self.totalCostOfReservation, state="readonly", width=10)
        totalCostOfReservationEntry.grid(row=3, column=2, sticky=W+E)

        # Date of Cancellation Entry
        self.dateOfCancellation =StringVar()
        dateOfCancellationEntry = Entry(cancelReservationWindow2, textvariable=self.dateOfCancellation, state="readonly", width=10)
        dateOfCancellationEntry.grid(row=4, column=2, sticky=W+E)

        # Amount to be Refunded Entry
        self.amountToBeRefunded = StringVar()
        amountToBeRefundedEntry = Entry(cancelReservationWindow2, textvariable=self.amountToBeRefunded, state="readonly",width=10)
        amountToBeRefundedEntry.grid(row=5, column=2, sticky=W+E)

        # Back Button
        backButton = Button(cancelReservationWindow2, text="Back", command=self.cancelReservationWindow2BackButtonClicked)
        backButton.grid(row=6, column=1)

        # Submit Button
        submitButton = Button(cancelReservationWindow2, text="Submit", command=self.cancelReservationWindow2SubmitButtonClicked)
        submitButton.grid(row=6, column=2)

    def cancelReservationWindow2BackButtonClicked(self):
        self.cancelReservationWindow2.destroy()
        self.createCancelReservationWindow1()
        self.buildCancelReservationWindow1(self.cancelReservationWindow1)

    def cancelReservationWindow2SubmitButtonClicked(self):
        self.cancelReservationWindow2.destroy()
        self.createChooseFunctionalityWindow()
        self.buildChooseFunctionalityWindow(self.chooseFunctionalityWindow)

#==========View Review Window===============

    def createViewReviewWindow(self):
        self.viewReviewWindow = Toplevel();
        self.viewReviewWindow.title("Train Sales System")

    def buildViewReviewWindow(self,viewReviewWindow):

        #View Review Label
        viewReviewLabel = Label(viewReviewWindow,text="View Review")
        viewReviewLabel.grid(row=1, column=2, sticky=W+E)

        #Train Number Label
        trainNumberLabel = Label(viewReviewWindow,text="Train Number")
        trainNumberLabel.grid(row=2, column=1, sticky=W+E)

        #Train Number Entry
        self.trainNumber = StringVar()
        trainNumberEntry = Entry(viewReviewWindow, textvariable=self.trainNumber,width=10)
        trainNumberEntry.grid(row=2, column=2, sticky=E)

        #Back Button
        backButton = Button(viewReviewWindow, text="Back", command = self.viewReviewWindowBackButtonClicked)
        backButton.grid(row=3, column=1)

        #Next Button
        nextButton = Button(viewReviewWindow, text="Next", command = self.viewReviewWindowNextButtonClicked)
        nextButton.grid(row=3, column=2)


    def viewReviewWindowBackButtonClicked(self):
        self.viewReviewWindow.destroy()
        self.chooseFunctionalityWindow.deiconify()

    def viewReviewWindowNextButtonClicked(self):
        self.viewReviewWindow.destroy()
        self.createViewReviewWindow2()
        self.buildViewReviewWindow2(self.viewReviewWindow2)


#=======View Review Window 2================

    def createViewReviewWindow2(self):
        self.viewReviewWindow2 = Toplevel();
        self.viewReviewWindow2.title("Train Sales System")


    def buildViewReviewWindow2(self,viewReviewWindow2):

        #View Review Label
        viewReviewLabel = Label(viewReviewWindow2,text="View Review")
        viewReviewLabel.grid(row=1, column=2, sticky=W+E)

        #View Review Treeview
        viewReviewTree = ttk.Treeview(viewReviewWindow2, column=("1", "2"),height=2)
        viewReviewTree.column("1", width = 150, anchor = "center")
        viewReviewTree.column("2", width = 150, anchor = "center")
        viewReviewTree.heading("1", text = "Rating")
        viewReviewTree.heading("2", text = "Comment")

        for i in range(2):
            viewReviewTree.insert('',i,values=('a'+str(i),'b'+str(i)))

        viewReviewTree.grid(row=2,column=1,columnspan=3)

        #Back to Choose Functionality Button
        backToChooseFunctionalityButton = Button(viewReviewWindow2, text="Back to Choose Functionality", command = self.viewReviewWindow2BackToChooseFunctionalityButtonClicked)
        backToChooseFunctionalityButton.grid(row=3,column=2,sticky=W+E)

    def viewReviewWindow2BackToChooseFunctionalityButtonClicked(self):
        self.viewReviewWindow2.destroy()
        self.chooseFunctionalityWindow.deiconify()


#=========Give Review Window==========

    def createGiveReviewWindow(self):
        self.giveReviewWindow = Toplevel();
        self.giveReviewWindow.title("Train Sales System")


    def buildGiveReviewWindow(self,giveReviewWindow):

        #Give Review Label
        giveReviewLabel = Label(giveReviewWindow,text="Give Review")
        giveReviewLabel.grid(row=1, column=2, sticky=W+E)

        #Train Number Label
        trainNumberLabel = Label(giveReviewWindow, text="Train Number")
        trainNumberLabel.grid(row=2,column=1,sticky=W)

        #Train Number Entry
        self.trainNumber = StringVar()
        trainNumberEntry = Entry(giveReviewWindow, textvariable=self.trainNumber)
        trainNumberEntry.grid(row=2, column=2, sticky=W+E)

        #Rating Label
        ratingLabel = Label(giveReviewWindow, text="Rating")
        ratingLabel.grid(row=3,column=1, sticky=W)

        #Rating Listbox
        self.rating = StringVar()
        self.rating.set("Very Good")
        ratingListbox = OptionMenu(giveReviewWindow, self.rating, "Very Good","Good", "Neutral", "Bad", "Very Bad")
        ratingListbox.grid(row=3,column=2)

        #Comment Label
        commentLabel = Label(giveReviewWindow,text="Comment")
        commentLabel.grid(row=4,column=1)

        #Comment Entry
        self.comment=StringVar()
        commentEntry=Entry(giveReviewWindow,textvariable=self.comment)
        commentEntry.grid(row=4,column=2)

        #Submit Button
        submitButton = Button(giveReviewWindow, text="Submit", command = self.giveReviewWindowSubmitButtonClicked)
        submitButton.grid(row=5,column=2,sticky=W+E)

    def giveReviewWindowSubmitButtonClicked(self):
        self.giveReviewWindow.destroy()
        self.chooseFunctionalityWindow.deiconify()



#========Manager starting from here===========
##            def __init__(self, username):
##        # self.username = username
##        # self.db = self.connect()
##        # self.cursor = self.db.cursor()
##        # self.cursor.execute("SELECT username FROM User WHERE username = %s", self.username)
##        # self.email = self.cursor.fetchone()[0]
##
##        # Manager's Menu - Choose Functionality
##        # Create function will create a window and pass this window to build function.
##        # After that the window will set into a mainloop().
##        self.createChooseFunctionalityWindow()
##        self.buildChooseFunctionalityWindow(self.chooseFunctionalityWindow)
##        self.chooseFunctionalityWindow.mainloop()

##  =======Choose Functionality Window=======

    def createChooseFunctionalityWindowManager(self):
        self.chooseFunctionalityWindowManager = Tk()
        self.chooseFunctionalityWindowManager.title("Train Sales System")

    def buildChooseFunctionalityWindowManager(self, chooseFunctionalityWindowManager):
        # Add components to window

        # Choose Functionality Label
        chooseFunctionalityLabel = Label(chooseFunctionalityWindowManager, text = "chooseFunctionalityWindow")
        chooseFunctionalityLabel.grid(row=1, column=1, sticky=W+E)

        # View Revenue Report Label
        viewRevenueReportLabel = Label(chooseFunctionalityWindowManager, text = "View revenue report")
        viewRevenueReportLabel.grid(row=2, column=1)
        viewRevenueReportLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowManagerViewRevenueReportLabelClicked)

        # View Popular Route Report
        viewPopularRouteReportLabel = Label(chooseFunctionalityWindowManager, text = "View popular route report")
        viewPopularRouteReportLabel.grid(row=3, column=1)
        viewPopularRouteReportLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowManagerViewPopularRouteReportLabelClicked)

        # Log Out Button
        logOutButton = Button(chooseFunctionalityWindowManager, text="Log out", command=self.chooseFunctionalityWindowManagerLogOutButtonClicked)
        logOutButton.grid(row=8, column=2, sticky=E)


##  ----------Choose Functionality Window Events----------
    def chooseFunctionalityWindowManagerViewRevenueReportLabelClicked(self, event):
        # When click the ViewRevenueReportLabel in ChooseFunctionalityWindow,
        # it will invoke the createViewRevenueReportWindow() and buildRevenueReportWindow();
        # and hide chooseFunctionalityWindow.
        self.createViewRevenueReportWindow()
        self.buildViewRevenueReportWindow(self.viewRevenueReportWindow)
        self.chooseFunctionalityWindowManager.withdraw()

    def chooseFunctionalityWindowManagerViewPopularRouteReportLabelClicked(self, event):
        # When click the ViewPopularRouteReportLabel in ChooseFunctionalityWindow,
        # it will invoke the createViewPopularRouteReportWindow() and buildViewPopularRouteReportWindow();
        # and hide chooseFunctionalityWindow.
        self.createViewPopularRouteReportWindow()
        self.buildViewPopularRouteReportWindow(self.viewPopularRouteReportWindow)
        self.chooseFunctionalityWindowManager.withdraw()

    def chooseFunctionalityWindowManagerLogOutButtonClicked(self):
        # When click logOutButton in chooseFunctionalityWindow,
        # it will destroy chooseFunctionalityWindow and display Login Window
        self.chooseFunctionalityWindowManager.destroy()
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
        self.chooseFunctionalityWindowManager.deiconify()

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
        self.chooseFunctionalityWindowManager.deiconify()




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
                                 db = 'cs4400_Team_20', user = 'cs4400_Team_20', passwd = 'rWL22HuB')
            return db
        except:
            messagebox.showwarning('Error!','Cannot connect. Please check your internet connection.')
            return False

a=GTTrain()
