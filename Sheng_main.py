from tkinter import *
import pymysql
from tkinter import messagebox

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


    def loginWindowRegisterButtonClicked(self):
        #点击Login Window上的Register Button时：
        #调用createNewUserRegistrationWindow；调用buildNewUserRegistrationWindow；
        #隐藏Login Window；把newUserRegistrationWindow置于顶层
        self.createNewUserRegistrationWindow()
        self.buildNewUserRegistrationWindow(self.newUserRegistrationWindow)
        self.loginWindow.withdraw()


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


        # Button
        createButton = Button(newUserRegistrationWindow, text="Create", command=self.newUserRegistrationWindowCreateButtonClicked)
        createButton.grid(row=6, column=3)

    
    
    def newUserRegistrationWindowCreateButtonClicked(self):
        #点击New User Registration Window上的Create Button时：
        #调用createChooseFunctionalityWindow；调用buildChooseFunctionalityWindow；
        #隐藏New User Registration Window
        
        self.createChooseFunctionalityWindow()
        self.buildChooseFunctionalityWindow(self.chooseFunctionalityWindow)
        self.newUserRegistrationWindow.withdraw()

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
        #
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

    
    def chooseFunctionalityWindowMakeANewReservationLabelClicked(self,event):
        #点击Choose Functionality Window上的MakeANewReservation Label时：
        #调用createSearchTrainWindow()；调用buildSearchTrainWindow()；
        #隐藏Choose Functionality Window
        self.createSearchTrainWindow()
        self.buildSearchTrainWindow(self.createSearchTrainWindow)
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
        #隐藏Choose Functionality Window
        #显示Login Window
        self.chooseFunctionalityWindow.withdraw()
        self.loginWindow.deiconify()


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
        #隐藏Add School Info Window
        #显示Choose Functionality Window
        self.addSchoolInfoWindow.withdraw()
        self.chooseFunctionalityWindow.deiconify()
        

    def addSchoolInfoWindowSubmitButtonClicked(self):
        #点击Add School Info Window上的Submit Button时：
        #隐藏Add School Info Window
        #显示Choose Functionality Window
        self.addSchoolInfoWindow.withdraw()
        self.chooseFunctionalityWindow.deiconify()

    def createSearchTrainWindow(self):
        #创建空白的Search Train Window
        self.createSearchTrainWindow=Toplevel()
        self.createSearchTrainWindow.title("Train Sales System")
    
    def buildSearchTrainWindow(self,createSearchTrainWindow):
        
        # Title Label
        titleLabel= Label(createSearchTrainWindow,text = "Search Train")
        titleLabel.grid(row=1,column=2,sticky=W+E)
        
        # Labels
        departsFromLabel= Label(createSearchTrainWindow,text = "Departs From")
        departsFromLabel.grid(row=2,column=1)
        arrivesAtLabel= Label(createSearchTrainWindow,text = "Arrives At")
        arrivesAtLabel.grid(row=3,column=1)
        departureDateLabel= Label(createSearchTrainWindow,text = "Departure Date")
        departureDateLabel.grid(row=4,column=1)
        
        # Button
        findTrainsButton = Button(createSearchTrainWindow, text="Find Trains", command=self.searchTrainWindowFindTrainsButtonClicked)
        findTrainsButton.grid(row=5, column=3)
        
        #drop down menu
        departsFromDate=StringVar(createSearchTrainWindow)
        
        #get stops informatin from the database. Below names are for demos only.
        
        departsFromDate.set("Boston(BBY)")
        departsFrom = OptionMenu(createSearchTrainWindow, departsFromDate, "New York", "Atlanta", "LA")
        departsFrom.grid(row=2,column=2)
        arrivesAtDate=StringVar(createSearchTrainWindow)
        arrivesAtDate.set("New York(Penn Station)")
        arrivesAt = OptionMenu(createSearchTrainWindow, arrivesAtDate, "Boston(BBY)", "Atlanta", "LA")
        arrivesAt.grid(row=3,column=2)

        #save a space for the calender
        calenderLabel= Label(createSearchTrainWindow,text = "Deperature Date")
        calenderLabel.grid(row=4,column=2)
    
    def searchTrainWindowFindTrainsButtonClicked(self):
         
        #点击Search Train Window上的Find Train Button时：
        #隐藏Search Train Window
        #显示Select Departure Window
        self.searchTrainWindow.withdraw()   
        
    
    def createSelectDepartureWindow(self):
        self.selectDepartureWindow = Toplevel()     
        self.selectDepartureWindow.title("Train Sales System")


    def buildSelectDepartureWindow(self selectDepartureWindow):
        departureLabel = Label(selectDepartureWindow, text = "Departure TABLE")
        departureLabel.grid(row=1, column=1, sticky= W+E)


        backButton = Button(selectDepartureWindow, text="Back", command=self.backButtonClicked)
        backButton.grid(row=2, column=1)

        nextButton = Button(selectDepartureWindow, text="Next", command=self.nextButtonClicked)
        nextButton.grid(row=2, column=2)
    
        
a=GTTrain()
