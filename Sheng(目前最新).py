from tkinter import *
import pymysql
from tkinter import messagebox
from tkinter import ttk

class GTTrain:
    def __init__(self):
        #调用createLoginWindow；调用buildLoginWindow；把loginWindow设为主循环
        #Connect to the database
        #self.db = self.connect()
        #self.cursor = self.db.cursor()
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
        #点击Login Window上的Login Button时：
        #获取输入的username和password；
        #调用
        #调用
        #隐藏Login Window；
        username = self.username.get()
        password = self.password.get()
        if not username:
            messagebox.showwarning("Username input is empty", "Please enter username.")
            return False
        if not password:
            messagebox.showwarning("Password input is empty", "Please enter password")
            return False
##        isAnInspectorUsername = self.cursor.execute("SELECT * FROM customer WHERE username = %s", username)
##        if not isAnInspectorUsername:
##            messagebox.showwarning("Username is not an inspector\'s username",
##                                   "The username you entered is not an inspector\'s username.")
##            return False
##        usernameAndPasswordMatch = self.cursor.execute(
##            "SELECT * FROM customer WHERE (username = %s AND password = %s)", (username, password))
##        if not usernameAndPasswordMatch:
##            messagebox.showwarning("Username and password don\'t match", "Sorry, the username and password you entered"
##                                                                         + " do not match.")
##            return False
        
        self.loginWindow.withdraw()
        self.createChooseFunctionalityWindow()
        self.buildChooseFunctionalityWindow(self.chooseFunctionalityWindow)


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
        self.username = StringVar()#这一行到底有没有问题啊……感觉有问题又不知道哪里有问题
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
        cancelAReservationLabel = Label(chooseFunctionalityWindow, text="cancel a Reservation")
        cancelAReservationLabel.grid(row=5,column=1)
        cancelAReservationLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowCancelAReservationLabelClicked)
      
        #Give Review Label
        giveReviewLabel = Label(chooseFunctionalityWindow, text="Give Review")
        giveReviewLabel.grid(row=6,column=1)
        giveReviewLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowGiveReviewLabelClicked)


        #Add School Information (Student Discount) Label
        addSchoolInformationStudentDiscountLabel = Label(chooseFunctionalityWindow, text="Add School Information (Student Discount)")
        addSchoolInformationStudentDiscountLabel.grid(row=7,column=1)
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
        #
        self.chooseFunctionalityWindow.withdraw()

    def chooseFunctionalityWindowCancelAReservationLabelClicked(self,event):
        #
        self.chooseFunctionalityWindow.withdraw()

    def chooseFunctionalityWindowGiveReviewLabelClicked(self,event):
        #
        self.chooseFunctionalityWindow.withdraw()

        
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
        backButton = Button(viewTrainScheduleWindow2, text="Back", command=self.viewTrainSchedule2BackButtonClicked)
        backButton.grid(row=4, column=1)

    def viewTrainSchedule2BackButtonClicked(self):
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
        self.selectDepartureWindow.withdraw()
        self.createTravelExtrasPassengerInfoWindow()
        self.buildTravelExtrasPassengerInfoWindow(self.travelExtrasPassengerInfoWindow)

 #=========Travel Extras & Passenger Window============


    def createTravelExtrasPassengerInfoWindow(self):
        self.travelExtrasPassengerInfoWindow = Toplevel()    
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
        self.selectDepartureWindow.deiconify()

    def travelExtrasPassengerInfoWindowNextButtonClicked(self):
        self.travelExtrasPassengerInfoWindow.withdraw()
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
        self.travelExtrasPassengerInfoWindow.deiconify()
        

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
        
    

    
        
a=GTTrain()
