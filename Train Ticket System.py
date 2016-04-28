from tkinter import *
from PIL import ImageTk, Image
import pymysql
from tkinter import messagebox
from tkinter import ttk
from datetime import datetime, timedelta
import decimal
class GTTrain:
    def __init__(self):
        # Invoke createLoginWindow; Invoke buildLoginWindow, Set loginWindow as mainloop
        #Connect to the database
        self.db = self.connect()
        self.cursor = self.db.cursor()
        # Login Window
        self.createLoginWindow()
        self.buildLoginWindow(self.loginWindow)
        self.loginWindow.mainloop()
        sys.exit()

##  =======Login Window=======
    def createLoginWindow(self):
        # Create blank Login Window
        self.loginWindow = Tk()
        self.loginWindow.title("Train Sales System")

        self.loginWindow.withdraw()
        self.loginWindow.update_idletasks()  # Update "requested size" from geometry manager
        x = (self.loginWindow.winfo_screenwidth() - self.loginWindow.winfo_reqwidth()) / 2
        y = (self.loginWindow.winfo_screenheight() - self.loginWindow.winfo_reqheight()) / 2
        self.loginWindow.geometry("+%d+%d" % (x, y))
        self.loginWindow.deiconify()

    def buildLoginWindow(self, loginWindow):
        # Add component for Login Window
        # Login Label
        loginLabel = Label(loginWindow, text="Login",font = "Verdana 13 bold ")
        loginLabel.grid(row=1, column=3, sticky=W+E)

        # Username Label
        usernameLabel = Label(loginWindow, text="Username")
        usernameLabel.grid(row=2, column=2, sticky=W)

        # Password Label
        passwordLabel = Label(loginWindow, text="Password")
        passwordLabel.grid(row=4, column=2, sticky=W)

        # # Image
        image = Image.open("buzzImage.jpg")
        image = image.resize((60, 60), Image.ANTIALIAS)
        buzzImage = ImageTk.PhotoImage(image)
        imageLabel = Label(loginWindow, image=buzzImage)
        imageLabel.image = buzzImage
        imageLabel.grid(row=2, column=4, rowspan=3, sticky=E)


        # Username Entry
        self.loginUsername = StringVar()
        usernameEntry = Entry(loginWindow, textvariable=self.loginUsername, width=20)
        usernameEntry.grid(row=2, column=3, sticky=W + E)


        # Password Entry
        self.loginPassword = StringVar()
        passwordEntry = Entry(loginWindow, textvariable=self.loginPassword, show = '*', width=20)
        passwordEntry.grid(row=4, column=3, sticky=W + E)

        # Login Buttons
        loginButton = Button(loginWindow, text="Login", command=self.loginWindowLoginButtonClicked)
        loginButton.grid(row=6, column=3)

        # Register Button

        registerButton = Button(loginWindow, text="Register", command=self.loginWindowRegisterButtonClicked)
        registerButton.grid(row=6, column=4, sticky=E)


    def loginWindowLoginButtonClicked(self):
        # Click the button on Login Window:
        # Obtain the username and password from keypress;
        # Invoke;
        # Invoke;
        # Withdraw Login Window;
        self.username = self.loginUsername.get()
        self.password = self.loginPassword.get()
        if not self.username:
            messagebox.showwarning("Username input is empty", "Please enter username.")
            return False
        if not self.password:
            messagebox.showwarning("Password input is empty", "Please enter password")
            return False
        isUsername = self.cursor.execute("SELECT * FROM User WHERE Username = %s", self.username)
        if not isUsername:
           messagebox.showwarning("Username is not an user\'s username",
                                  "The username you entered is not an user\'s username.")
           return False
        usernameAndPasswordMatch = self.cursor.execute(
           "SELECT * FROM User WHERE (Username = %s AND Password = %s)", (self.username, self.password))
        if not usernameAndPasswordMatch:
           messagebox.showwarning("Username and password don\'t match", "Sorry, the username and password you entered"
                                                                        + " do not match.")
           return False

        isManagerName = self.cursor.execute("SELECT * FROM Manager WHERE Username = %s", (self.username))
        if isManagerName:
            self.loginWindow.withdraw()
            self.createChooseFunctionalityWindowManager()
            self.buildChooseFunctionalityWindowManager(self.chooseFunctionalityWindowManager)
        else:
            self.loginWindow.withdraw()
            self.createChooseFunctionalityWindow()
            self.buildChooseFunctionalityWindow(self.chooseFunctionalityWindow)
        return True

    def loginWindowRegisterButtonClicked(self):
        # Click button on Login Window:
        # Invoke createNewUserRegistrationWindow; Invoke buildNewUserRegistrationWindow;
        # Hide Login Window; Set newUserRegistrationWindow on the top
        self.createNewUserRegistrationWindow()
        self.buildNewUserRegistrationWindow(self.newUserRegistrationWindow)
        self.loginWindow.withdraw()

#======New User Registration Window==============


    def createNewUserRegistrationWindow(self):
        # Create blank newUserRegistrationWindow
        self.newUserRegistrationWindow = Toplevel()
        self.newUserRegistrationWindow.title("Train Sales System")



    def buildNewUserRegistrationWindow(self,newUserRegistrationWindow):
        # Add components for newUserRegistrationWindow

        # New User Rigestration Label
        newUserRegistrationLabel = Label(newUserRegistrationWindow, text="New User Registration",font = "Verdana 13 bold ")
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
        self.registrationUsername = StringVar()
        usernameEntry = Entry(newUserRegistrationWindow, textvariable=self.registrationUsername, width=20)
        usernameEntry.grid(row=2, column=3, sticky=W + E)


        # Email Address Entry
        self.registrationEmailAddress = StringVar()
        emailAddressEntry = Entry(newUserRegistrationWindow, textvariable=self.registrationEmailAddress,width=20)
        emailAddressEntry.grid(row=3, column=3, sticky=W + E)

        # Password Entry
        self.registrationPassword = StringVar()
        passwordEntry = Entry(newUserRegistrationWindow, textvariable=self.registrationPassword,show = '*',width=20)
        passwordEntry.grid(row=4, column=3, sticky=W + E)

        # Confirm Password Entry
        self.registrationConfirmPassword = StringVar()
        confirmPasswordEntry = Entry(newUserRegistrationWindow, textvariable=self.registrationConfirmPassword,show = '*',width=20)
        confirmPasswordEntry.grid(row=5, column=3, sticky=W + E)


        # Create Button
        createButton = Button(newUserRegistrationWindow, text="Create", command=self.newUserRegistrationWindowCreateButtonClicked)
        createButton.grid(row=6, column=3)

    def newUserRegistrationWindowCreateButtonClicked(self):
        # Click the Create Button on New User Registration Window:
        # Invoke createChooseFunctionalityWindow; Invoke buildChooseFunctionalityWindow;
        # Destroy New User Registration Window
        self.username = self.registrationUsername.get()
        self.emailAddress = self.registrationEmailAddress.get()
        self.password = self.registrationPassword.get()
        self.confirmPassword = self.registrationConfirmPassword.get()
        if not self.username:
            messagebox.showwarning("Username input is empty", "Please enter username.")
            return False
        if not self.emailAddress:
            messagebox.showwarning("E-mail input is empty", "Please enter E-mail.")
            return False
        if not self.password:
            messagebox.showwarning("Password input is empty", "Please enter password")
            return False
        if not self.confirmPassword:
            messagebox.showwarning("Confirm password input is empty", "Please enter confirm password")
            return False

        isUsername = self.cursor.execute("SELECT * FROM User WHERE Username = %s", self.username)
        if isUsername:
           messagebox.showwarning("This username has been used.",
                                  "Please input another username.")
           return False
        isEmail = self.cursor.execute("SELECT * FROM Customer WHERE Email = %s", self.emailAddress)
        if isEmail:
           messagebox.showwarning("This E-mail address has been used.",
                                  "Please input another E-mail address.")
           return False
        if not (self.password == self.confirmPassword):
           messagebox.showwarning("Password does not match the confirm password.",
                                  "Please reconfirm the password.")
           return False
        messagebox.showinfo("info","Register successfully!")
        self.cursor.execute("INSERT INTO Customer VALUES (%s, %s, 0)", (self.username, self.emailAddress))
        self.cursor.execute("INSERT INTO User VALUES (%s, %s)", (self.username, self.password))
        self.createChooseFunctionalityWindow()
        self.buildChooseFunctionalityWindow(self.chooseFunctionalityWindow)
        self.newUserRegistrationWindow.destroy()

##==========Choose Functionality Window================

    def createChooseFunctionalityWindow(self):
        # Create blank chooseFunctionalityWindow
        self.chooseFunctionalityWindow = Toplevel()
        self.chooseFunctionalityWindow.title("Train Sales System")

    def buildChooseFunctionalityWindow(self,chooseFunctionalityWindow):
        # Add component to chooseFunctionalityWindow

        #Choose Functionality Label
        chooseFunctionalityLabel = Label(chooseFunctionalityWindow, text="Choose Functionality",font = "Verdana 10 bold ")
        chooseFunctionalityLabel.grid(row=1, column=1, sticky=W+E)

        # View Train Schedule Label
        viewTrainScheduleLabel = Label(chooseFunctionalityWindow, text="View Train Schedule")
        viewTrainScheduleLabel.grid(row=2, column=1)
        viewTrainScheduleLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowViewTrainScheduleLabelClicked)

        # Make a New Reservation Label
        makeANewReservationLabel = Label(chooseFunctionalityWindow, text="Make a New Reservation")
        makeANewReservationLabel.grid(row=3, column=1)
        makeANewReservationLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowMakeANewReservationLabelClicked)


        # Update a Reservation Label
        updateAReservationLabel = Label(chooseFunctionalityWindow, text="Update a Reservation")
        updateAReservationLabel.grid(row=4,column=1)
        updateAReservationLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowUpdateAReservationLabelClicked)

        # Cancel a Reservation Label
        cancelAReservationLabel = Label(chooseFunctionalityWindow, text="Cancel a Reservation")
        cancelAReservationLabel.grid(row=5,column=1)
        cancelAReservationLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowCancelAReservationLabelClicked)


        # View Review Label
        viewReviewLabel = Label(chooseFunctionalityWindow, text="View Review")
        viewReviewLabel.grid(row=6,column=1)
        viewReviewLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowViewReviewLabelClicked)

        # Give Review Label
        giveReviewLabel = Label(chooseFunctionalityWindow, text="Give Review")
        giveReviewLabel.grid(row=7,column=1)
        giveReviewLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowGiveReviewLabelClicked)


        # Add School Information (Student Discount) Label
        addSchoolInformationStudentDiscountLabel = Label(chooseFunctionalityWindow, text="Add School Information (Student Discount)")
        addSchoolInformationStudentDiscountLabel.grid(row=8,column=1)
        addSchoolInformationStudentDiscountLabel.bind("<ButtonPress-1>", self.chooseFunctionalityWindowAddSchoolInformationStudentDiscountLabelClicked)

        # Log Out Buttons

        logOutButton = Button(chooseFunctionalityWindow, text="Log out", command=self.chooseFunctionalityWindowLogOutButtonClicked)
        logOutButton.grid(row=8, column=2,sticky=E)

    def chooseFunctionalityWindowViewTrainScheduleLabelClicked(self,event):
        # Click ViewTrainSchedule Label on Choose Functionality Window:
        # Invoke createViewTrainScheduleWindow(); Invoke buildViewTrainScheduleWindow();
        # Hide Choose Functionality Window.
        self.createViewTrainScheduleWindow()
        self.buildViewTrainScheduleWindow(self.viewTrainScheduleWindow)
        self.chooseFunctionalityWindow.withdraw()


    def chooseFunctionalityWindowMakeANewReservationLabelClicked(self,event):
        # Click MakeANewReservation Label on Choose Functionality Window:
        # Invoke createSearchTrainWindow(); Invoke buildSearchTrainWindow()；
        # Hide Choose Functionality Window
        self.informationList = []
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
        # Click Add School Information Label on Choose Functionality Window:
        # Invoke createAddSchoolInfoWindow(); Invoke buildAddSchoolWindow()；
        # Hide Choose Functionality Window
        self.createAddSchoolInfoWindow()
        self.buildAddSchoolInfoWindow(self.addSchoolInfoWindow)
        self.chooseFunctionalityWindow.withdraw()

    def chooseFunctionalityWindowLogOutButtonClicked(self):
        # Click Log Out Buttion on Choose Functionality Window:
        # Destroy Choose Functionality Window
        # Display Login Window
        self.chooseFunctionalityWindow.destroy()
        self.loginWindow.deiconify()

#=========View Train Schedule Window============

    def createViewTrainScheduleWindow(self):
        self.viewTrainScheduleWindow = Toplevel()
        self.viewTrainScheduleWindow.title("Train Sales System")

    def buildViewTrainScheduleWindow(self,viewTrainScheduleWindow):
        # Title Label
        viewTrainScheduleLabel = Label(viewTrainScheduleWindow, text="View Train Schedule",font = "Verdana 10 bold ")
        viewTrainScheduleLabel.grid(row=1, column=1, sticky=W+E)
        # Train Number Label
        trainNumberLabel = Label(viewTrainScheduleWindow, text="Train Number")
        trainNumberLabel.grid(row=2, column=1, sticky=W)

        # Train Number Entry
        self.viewTrainScheduleTrainNumberSV = StringVar()
        trainNumberEntry = Entry(viewTrainScheduleWindow, textvariable = self.viewTrainScheduleTrainNumberSV, width=20)
        trainNumberEntry.grid(row=2, column=2, sticky=E)

        # Buttons
        searchButton = Button(viewTrainScheduleWindow, text="Search", command=self.viewTrainScheduleSearchButtonClicked)
        searchButton.grid(row=3, column=1)


    def viewTrainScheduleSearchButtonClicked(self):
        # Click Search Button and create View Train Schedule Window 2, destroy current window
        self.viewTrainScheduleTrainNumber = self.viewTrainScheduleTrainNumberSV.get()
        if not self.viewTrainScheduleTrainNumber:
            messagebox.showwarning("Error", "Train number input is empty. Please enter train number.")
            return False
        isTrainNumber = self.cursor.execute("SELECT TrainNum FROM TrainRoute WHERE TrainNum = %s", self.viewTrainScheduleTrainNumber)
        if not isTrainNumber:
            messagebox.showwarning("Error", "The train number is not valid.")
            return False
        self.createViewTrainScheduleWindow2()
        self.bulidViewTrainScheduleWindow2(self.viewTrainScheduleWindow2)
        self.viewTrainScheduleWindow.destroy()

#=============View Train Schedule Window 2=============

    def createViewTrainScheduleWindow2(self):
        self.viewTrainScheduleWindow2 = Toplevel()
        self.viewTrainScheduleWindow2.title("Train Sales System")

    def bulidViewTrainScheduleWindow2(self,viewTrainScheduleWindow2):
        # Label
        viewTrainScheduleLabel = Label(viewTrainScheduleWindow2, text= "View Train Schedule",font = "Verdana 10 bold ")
        viewTrainScheduleLabel.grid(row=1, column=1, sticky=W+E)

        # Build the form
        tree = ttk.Treeview(viewTrainScheduleWindow2, column=("First", "Second", "Third", "Fourth"))
        # Hide the first blank column
        tree['show'] = 'headings'

        tree.column("First", width = 150, anchor = "center")
        tree.column("Second", width = 100, anchor = "center")
        tree.column("Third", width = 100, anchor = "center")
        tree.column("Fourth", width = 100, anchor = "center")
        tree.heading("First", text = "Train (Train Number)")
        tree.heading("Second", text = "Arrival Time")
        tree.heading("Third", text = "Departure Time")
        tree.heading("Fourth", text = "Station")

        self.cursor.execute("SELECT * FROM Stop WHERE TrainNum = %s ORDER BY ArrivalTime", self.viewTrainScheduleTrainNumber)
        trainScheduleTuple = self.cursor.fetchall()
        trainScheduleTrainNumberList = [self.viewTrainScheduleTrainNumber]
        trainScheduleArrivalTimeList = []
        trainscheduleDepartureTimeList = []
        trainscheduleStationList = []
        for i in trainScheduleTuple:
            trainScheduleTrainNumberList.append('')
            trainscheduleStationList.append(i[1])
            trainScheduleArrivalTimeList.append(i[2])
            trainscheduleDepartureTimeList.append(i[3])

        for row in range(len(trainscheduleStationList)):
            tree.insert('',row, values=(trainScheduleTrainNumberList[row],trainScheduleArrivalTimeList[row],trainscheduleDepartureTimeList[row],trainscheduleStationList[row]))

        tree.grid(row=3,column=1)

        # Button
        backButton = Button(viewTrainScheduleWindow2, text="Back", command=self.viewTrainScheduleWindow2BackButtonClicked)
        backButton.grid(row=4, column=1)

    def viewTrainScheduleWindow2BackButtonClicked(self):
        # Click Back to destroy current window and display Choose Functionality Window
        self.viewTrainScheduleWindow2.destroy()
        self.chooseFunctionalityWindow.deiconify()

#=========Add School Info Window============

    def createAddSchoolInfoWindow(self):
        # Create blank Add School Info Window
        self.addSchoolInfoWindow = Toplevel()
        self.addSchoolInfoWindow.title("Train Sales System")

    def buildAddSchoolInfoWindow(self,addSchoolInfoWindow):
        # Add component to Add School Info Window

        # Add School Info Label
        addSchoolInfoLabel = Label(addSchoolInfoWindow, text="Add School Info")
        addSchoolInfoLabel.grid(row=1, column=1, sticky=W+E)

        # School Email Address
        schoolEmailAddressLabel = Label(addSchoolInfoWindow, text="School Email Address")
        schoolEmailAddressLabel.grid(row=2, column=1, sticky=W)

        # Your School Label
        yourSchoolLabel =  Label(addSchoolInfoWindow,text=" Your school email address ends with edu.")
        yourSchoolLabel.grid(row=3, column=1, sticky=W)

        # School Email Entry
        self.addSchoolInfoSchoolEmailAddress = StringVar()
        schoolEmailAddressEntry = Entry(addSchoolInfoWindow, textvariable=self.addSchoolInfoSchoolEmailAddress, width=20)
        schoolEmailAddressEntry.grid(row=2, column=2, sticky=E)

        # Back Button
        backButton = Button(addSchoolInfoWindow, text="Back", command=self.addSchoolInfoWindowBackButtonClicked)
        backButton.grid(row=4, column=1)

        # Submit Button
        submitButton = Button(addSchoolInfoWindow, text="Submit", command=self.addSchoolInfoWindowSubmitButtonClicked)
        submitButton.grid(row=4, column=2,sticky=E)


    def addSchoolInfoWindowBackButtonClicked(self):
        # Click Back Button on Add School Info Window:
        # Destroy Add School Info Window
        # Display Choose Functionality Window
        self.addSchoolInfoWindow.destroy()
        self.chooseFunctionalityWindow.deiconify()


    def addSchoolInfoWindowSubmitButtonClicked(self):
        # Click Submit Button on Add School Info Window:
        # Destroy Add School Info Window
        # Display Choose Functionality Window
        self.schoolEmailAddress = self.addSchoolInfoSchoolEmailAddress.get()
        if not self.schoolEmailAddress:
            messagebox.showwarning("Error", "School E-mail address input is empty. Please enter school E-mail address.")
            return False
        if self.schoolEmailAddress[-4:] != ".edu":
            messagebox.showwarning("Error", "This is not a school E-mail address.")
            return False
        self.cursor.execute("Update Customer SET isStudent = 1 WHERE Username = %s", self.username)
        self.addSchoolInfoWindow.destroy()
        self.chooseFunctionalityWindow.deiconify()
        return True


#=========Search Train Window============

    def createSearchTrainWindow(self):
        # Create blank Search Train Window
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

        backButton = Button(searchTrainWindow, text="Back", command=self.searchTrainWindowBackButtonClicked)
        backButton.grid(row=5,column=1)

        # Get stops informatin from the database.

        self.cursor.execute("SELECT StationName From Stop GROUP BY StationName")
        stationNameTuple = self.cursor.fetchall()

        stationNameList = []
        for i in stationNameTuple:
            stationNameList.append(i[0])
        # Drop down menu
        self.departsFromSV=StringVar()
        self.departsFromSV.set(stationNameList[0])

        departsFromOptionMenu = OptionMenu(searchTrainWindow, self.departsFromSV, *stationNameList)
        departsFromOptionMenu.grid(row=2,column=2)

        self.arrivesAtSV=StringVar()
        self.arrivesAtSV.set(stationNameList[0])

        arrivesAtOptionMenu = OptionMenu(searchTrainWindow, self.arrivesAtSV, *stationNameList)
        arrivesAtOptionMenu.grid(row=3,column=2)


        self.departureDateSV = StringVar()
        self.departureDateSV.set("yyyy-mm-dd")
        departureDateEntry = Entry(searchTrainWindow, textvariable=self.departureDateSV,width=20)
        departureDateEntry.grid(row=4, column=2,sticky=W)

    def searchTrainWindowFindTrainsButtonClicked(self):

        # Click Find Train Button on Search Train Window:
        # Destroy Search Train Window
        # Display Select Departure Window

        self.departsFrom = self.departsFromSV.get()
        self.arrivesAt = self.arrivesAtSV.get()
        self.departureDate = self.departureDateSV.get()

        if self.departsFrom == self.arrivesAt:
            messagebox.showwarning("Error", "Your departure station and destination are the same.")
            return False
        if datetime.strptime(self.departureDate, '%Y-%m-%d').date() < datetime.today().date():
            messagebox.showwarning("Error", "Departure date cannot be earlier than today")
            return False

        try:
            datetime.strptime(self.departureDate, '%Y-%m-%d')
        except ValueError:
            messagebox.showwarning("Error", "Departure date is not valid. (yyyy-mm-dd)")
            return False

        self.searchTrainWindow.destroy()
        self.createSelectDepartureWindow()
        self.buildSelectDepartureWindow(self.selectDepartureWindow)

    def  searchTrainWindowBackButtonClicked(self):
        self.searchTrainWindow.destroy()
        self.chooseFunctionalityWindow.deiconify()

  #=========Select Departure Window============

    def createSelectDepartureWindow(self):
        self.selectDepartureWindow = Toplevel()
        self.selectDepartureWindow.title("Train Sales System")


    def buildSelectDepartureWindow(self,selectDepartureWindow):
        # Label
        departureLabel = Label(selectDepartureWindow, text = "Select Departure")
        departureLabel.grid(row=1, column=1, sticky= W+E)


        # Build the form
        # Need to add radio button

        self.selectDepartureTree = ttk.Treeview(selectDepartureWindow, column=("1", "2", "3", "4","5","6"))
        self.selectDepartureTree['show'] = "headings"
        self.selectDepartureTree.column("1", width = 150, anchor = "center")
        self.selectDepartureTree.column("2", width = 150, anchor = "center")
        self.selectDepartureTree.column("3", width = 150, anchor = "center")
        self.selectDepartureTree.column("4", width = 150, anchor = "center")
        self.selectDepartureTree.column("5", width = 150, anchor = "center")
        self.selectDepartureTree.column("6", width = 150, anchor = "center")

        self.selectDepartureTree.heading("1", text = "Train (Train Number)")
        self.selectDepartureTree.heading("2", text = "Departure Time")
        self.selectDepartureTree.heading("3", text = "Arrival Time")
        self.selectDepartureTree.heading("4", text = "Duration")
        self.selectDepartureTree.heading("5", text = "1st Class Price")
        self.selectDepartureTree.heading("6", text = "2nd Class Price")

        self.cursor.execute("SELECT tr.TrainNum, s.DepartureTime, s.ArrivalTime, tr.FstClassPrice, tr.SndClassPrice FROM\
                            (SELECT departure.TrainNum, departure.DepartureTime, arrival.ArrivalTime  FROM\
                            (SELECT TrainNum, DepartureTime\
                            FROM Stop\
                            WHERE StationName = %s\
                            AND DepartureTime IS NOT NULL) departure\
                            JOIN\
                            (SELECT TrainNum, ArrivalTime\
                            FROM Stop\
                            WHERE StationName = %s\
                            AND ArrivalTime IS NOT NULL) arrival\
                            ON departure.TrainNum = arrival.TrainNum AND departure.DepartureTime < arrival.ArrivalTime) s\
                            JOIN TrainRoute tr\
                            ON tr.TrainNum = s.TrainNum",(self.departsFrom, self.arrivesAt))

        self.selectDepartureTuple = self.cursor.fetchall()
        self.trainNumList = []
        self.departureTimeList = []
        self.arrivalTimeList = []
        self.durationList = []
        self.fstClassPriceList = []
        self.sndClassPriceList = []

        for i in self.selectDepartureTuple:
            self.trainNumList.append(i[0])
            self.departureTimeList.append(i[1])
            self.arrivalTimeList.append(i[2])
            self.durationList.append(i[2]-i[1])
            self.fstClassPriceList.append(i[3])
            self.sndClassPriceList.append(i[4])




        # Insert data into the treeview
        for i in range(len(self.selectDepartureTuple)):
            self.selectDepartureTree.insert('',i,values=(self.trainNumList[i],self.departureTimeList[i],self.arrivalTimeList[i],self.durationList[i],self.fstClassPriceList[i],self.sndClassPriceList[i]))

        self.selectDepartureTree.grid(row=2,column=1, columnspan=4)


        #Radio button
        self.trainClassIV = IntVar()
        fstClassRadioButton = Radiobutton(selectDepartureWindow, text="Choose First Class", variable=self.trainClassIV, value=1)
        fstClassRadioButton.grid(row=3, column=3)
        sndClassRadioButton = Radiobutton(selectDepartureWindow, text="Choose Second Class", variable=self.trainClassIV, value=2)
        sndClassRadioButton.grid(row=3, column=4)

        # Buttons
        backButton = Button(selectDepartureWindow, text="Back", command=self.selectDepartureBackButtonClicked)
        backButton.grid(row=4, column=1)

        nextButton = Button(selectDepartureWindow, text="Next", command=self.selectDepartureNextButtonClicked)
        nextButton.grid(row=4, column=2)


    def selectDepartureBackButtonClicked(self):
        self.selectDepartureWindow.destroy()
        self.createSearchTrainWindow()
        self.buildSearchTrainWindow(self.searchTrainWindow)


    def selectDepartureNextButtonClicked(self):
        if not self.selectDepartureTree.focus():
            messagebox.showwarning("Error","You haven't selected any train.")
            return False

        if not self.trainClassIV.get():
            messagebox.showwarning("Error","You haven't selected any class.")
            return False

        treeIndexString = self.selectDepartureTree.focus()
        treeIndex = int(treeIndexString[1:])
        self.selectedTrainNum = self.trainNumList[treeIndex-1]
        self.selectedDepartureTime = self.departureTimeList[treeIndex-1]
        self.selectedArrivalTime = self.arrivalTimeList[treeIndex-1]
        self.selectedDuration = self.durationList[treeIndex-1]
        self.selectedClass = self.trainClassIV.get()
        if self.trainClassIV.get() == 1:
            self.selectedClass = "1st Class"
            self.selectedPrice = self.fstClassPriceList[treeIndex-1]
        elif self.trainClassIV.get() == 2:
            self.selectedClass = "2nd Class"
            self.selectedPrice = self.sndClassPriceList[treeIndex-1]


        self.selectDepartureWindow.destroy()
        self.createTravelExtrasPassengerInfoWindow()
        self.buildTravelExtrasPassengerInfoWindow(self.travelExtrasPassengerInfoWindow)


 #=========Travel Extras & Passenger Window============


    def createTravelExtrasPassengerInfoWindow(self):
        self.travelExtrasPassengerInfoWindow =Toplevel()
        self.travelExtrasPassengerInfoWindow.title("Train Sales System")

    def buildTravelExtrasPassengerInfoWindow(self,travelExtrasPassengerInfoWindow):
        # Title Label
        titleLabel= Label(travelExtrasPassengerInfoWindow,text = "Travel Extras & Passenger Info")
        titleLabel.grid(row=1,column=1,sticky=W+E)

        # Labels
        numberOfBaggageLabel= Label(travelExtrasPassengerInfoWindow,text = "Number of Baggage")
        numberOfBaggageLabel.grid(row=2,column=1)
        textLabel=Label(travelExtrasPassengerInfoWindow,text = "Every passenger can bring up to 4 baggage 2 free of charge, 2 for $30 per bag.")
        textLabel.grid(row=3,column=1)
        passergenNameLabel= Label(travelExtrasPassengerInfoWindow,text = "Passergen Name")
        passergenNameLabel.grid(row=4,column=1)

        # Entry
        self.passengerNameSV = StringVar()
        passengerNameEntry = Entry(travelExtrasPassengerInfoWindow, textvariable=self.passengerNameSV,width=20)
        passengerNameEntry.grid(row=4, column=2)

        # Drop down menu
        self.numberOfBaggageIV=IntVar()
        self.numberOfBaggageIV.set(0)
        numberOfBaggageOptionMenu = OptionMenu(travelExtrasPassengerInfoWindow, self.numberOfBaggageIV,0,1,2,3,4)
        numberOfBaggageOptionMenu.grid(row=2,column=2)

        # Buttons
        travelExtrasPassengerInfoWindowBackButton = Button(travelExtrasPassengerInfoWindow, text="Back", command=self.travelExtrasPassengerInfoWindowBackButtonClicked)
        travelExtrasPassengerInfoWindowBackButton.grid(row=5, column=1)
        travelExtrasPassengerInfoWindowNextButton = Button(travelExtrasPassengerInfoWindow, text="Next", command=self.travelExtrasPassengerInfoWindowNextButtonClicked)
        travelExtrasPassengerInfoWindowNextButton.grid(row=5, column=3)


    def travelExtrasPassengerInfoWindowBackButtonClicked(self):
        self.travelExtrasPassengerInfoWindow.destroy()
        self.createSelectDepartureWindow()
        self.buildSelectDepartureWindow(self.selectDepartureWindow)

    def travelExtrasPassengerInfoWindowNextButtonClicked(self):


        if not self.passengerNameSV.get():
            messagebox.showwarning("Error", "Passenger name input is empty. Please enter passenger name.")
            return False

        self.selectedNumberOfBaggage = self.numberOfBaggageIV.get()
        self.passengerName = self.passengerNameSV.get()
        self.selectedPrice = self.selectedPrice
        self.informationList.append((self.selectedTrainNum,self.departureDate, self.selectedDepartureTime,self.selectedArrivalTime, self.selectedDuration,self.departsFrom,self.arrivesAt,self.selectedClass,self.selectedPrice,self.selectedNumberOfBaggage,self.passengerName))


        self.travelExtrasPassengerInfoWindow.destroy()
        self.createMakeReservationWindow()
        self.buildMakeReservationWindow(self.makeReservationWindow)

 #=========Make Reservation Window============

    def createMakeReservationWindow(self):

        self.makeReservationWindow =Toplevel()
        self.makeReservationWindow.title("Train Sales System")


    def buildMakeReservationWindow(self, makeReservationWindow):
        # Title Label
        makeReservationLabel= Label(makeReservationWindow,text = "Make Reservation")
        makeReservationLabel.grid(row=1,column=2,sticky=W+E)

        # Labels
        currentlySelectedLabel= Label(makeReservationWindow,text = "Currently Selected")
        currentlySelectedLabel.grid(row=2,column=1,sticky=W)


        # Build the form

        self.currentlySelectedTree = ttk.Treeview(makeReservationWindow, column=("1", "2", "3", "4", "5", "6" ,"7", "8","9","10","11"))
        self.currentlySelectedTree['show'] = "headings"
        self.currentlySelectedTree.column("1", width = 100, anchor = "center")
        self.currentlySelectedTree.column("2", width = 100, anchor = "center")
        self.currentlySelectedTree.column("3", width = 100, anchor = "center")
        self.currentlySelectedTree.column("4", width = 100, anchor = "center")
        self.currentlySelectedTree.column("5", width = 100, anchor = "center")
        self.currentlySelectedTree.column("6", width = 100, anchor = "center")
        self.currentlySelectedTree.column("7", width = 100, anchor = "center")
        self.currentlySelectedTree.column("8", width = 100, anchor = "center")
        self.currentlySelectedTree.column("9", width = 100, anchor = "center")
        self.currentlySelectedTree.column("10", width = 100, anchor = "center")
        self.currentlySelectedTree.column("11", width = 100, anchor = "center")

        self.currentlySelectedTree.heading("1", text = "Train (Train Number)")
        self.currentlySelectedTree.heading("2", text = "Departure Date")
        self.currentlySelectedTree.heading("3", text = "Departure Time")
        self.currentlySelectedTree.heading("4", text = "Arrival Time")
        self.currentlySelectedTree.heading("5", text = "Duration")
        self.currentlySelectedTree.heading("6", text = "Departs From")
        self.currentlySelectedTree.heading("7", text = "Arrives At")
        self.currentlySelectedTree.heading("8", text = "Class")
        self.currentlySelectedTree.heading("9", text = "Price")
        self.currentlySelectedTree.heading("10", text = "Number of Baggages")
        self.currentlySelectedTree.heading("11", text = "Passenger Name")


        # Insert data into the form
        for i in range(len(self.informationList)):
            self.currentlySelectedTree.insert('',i, values=self.informationList[i])

        self.currentlySelectedTree.grid(row = 3,column =1,columnspan=3)

        # Labels


        self.cursor.execute("SELECT IsStudent FROM Customer WHERE Username = %s",self.username)
        self.studentStatus = self.cursor.fetchall()

        if self.studentStatus[0][0]:
            studentDiscountAppliedLabel= Label(makeReservationWindow,text = "Student Discount Applied")
        else:
            studentDiscountAppliedLabel= Label(makeReservationWindow,text = "Student Discount Not Applied")
        studentDiscountAppliedLabel.grid(row=4, column=1,sticky=W)

        totalCostLabel= Label(makeReservationWindow,text = "Total Cost")
        totalCostLabel.grid(row=5, column=1,sticky=W)

        totalCost = 0
        for i in self.informationList:
            totalCost = totalCost + i[8] + max(0,(i[9] - 2)*30)

        totalCost = float(totalCost)

        if self.studentStatus[0][0]:
            totalCost = totalCost * 0.8

        # Cost display Entry
        self.totalCost = DoubleVar()
        self.totalCost.set(totalCost)
        totalCostEntry = Entry(makeReservationWindow, textvariable = self.totalCost, width=10)
        totalCostEntry.grid(row=5, column=2,sticky=W)

        # Use Card Label
        useCardLabel= Label(makeReservationWindow,text = "Use Card")
        useCardLabel.grid(row=6, column=1,sticky=W)


        #OptionMenu

        self.cursor.execute("SELECT CardNum FROM PaymentInfo WHERE Username = %s",self.username)
        cardNumTuple = self.cursor.fetchall()

        self.cardNumList = []

        if cardNumTuple:
            for i in cardNumTuple:
                self.cardNumList.append(i[0])

        self.usingCardSV = StringVar()
        if self.cardNumList:
            self.usingCardSV.set(self.cardNumList[0])
            usingCardOptionMenu = OptionMenu(makeReservationWindow, self.usingCardSV, *self.cardNumList)
        else:
            usingCardOptionMenu = OptionMenu(makeReservationWindow, self.usingCardSV, [])
        usingCardOptionMenu.grid(row = 6, column = 2,sticky=E+W)


        # Add Card Label
        addCardLabel = Label(makeReservationWindow, text="Add Card",font = "Verdana 13 bold ")
        addCardLabel.grid(row = 6, column = 3,sticky=W)
        addCardLabel.bind("<ButtonPress-1>", self.makeReservationWindowAddCardLabelClicked)


        # Continue adding a train Label
        continueAddingATrainLabel = Label(makeReservationWindow, text="Continue adding a train",font = "Verdana 13 bold ")
        continueAddingATrainLabel.grid(row = 7, column = 1,sticky=W)
        continueAddingATrainLabel.bind("<ButtonPress-1>", self.makeReservationWindowContinueAddingATrainLabelClicked)


        # Buttons
        makeReservationWindowBackButton = Button(makeReservationWindow, text="Back", command=self.makeReservationWindowBackButtonClicked)
        makeReservationWindowBackButton.grid(row=8, column=1,sticky=W)

        makeReservationWindowSumbitButton = Button(makeReservationWindow, text="Submit", command=self.makeReservationWindowSubmitButtonClicked)
        makeReservationWindowSumbitButton.grid(row=8, column=2,sticky=W)

        makeReservationWindowRemoveButton = Button(makeReservationWindow, text="Remove", command=self.makeReservationWindowRemoveButtonClicked)
        makeReservationWindowRemoveButton.grid(row=5, column=3,sticky=W)


    def makeReservationWindowRemoveButtonClicked(self):
        if not self.currentlySelectedTree.focus():
            messagebox.showwarning("Error","You haven't selected any train.")
            return False

        treeIndexString = self.currentlySelectedTree.focus()
        treeIndex = int(treeIndexString[1:])

        del self.informationList[treeIndex-1]
        self.makeReservationWindow.destroy()
        self.createMakeReservationWindow()
        self.buildMakeReservationWindow(self.makeReservationWindow)


    def makeReservationWindowAddCardLabelClicked(self,event):
        self.createPaymentInfoWindow()
        self.buildPaymentInfoWindow(self.paymentInfoWindow)
        self.makeReservationWindow.destroy()

    def makeReservationWindowContinueAddingATrainLabelClicked(self,event):
        self.makeReservationWindow.destroy()
        self.createSearchTrainWindow()
        self.buildSearchTrainWindow(self.searchTrainWindow)

    def makeReservationWindowBackButtonClicked(self):
        if len(self.informationList) != 0:
            del self.informationList[-1]
        self.makeReservationWindow.destroy()
        self.createTravelExtrasPassengerInfoWindow()
        self.buildTravelExtrasPassengerInfoWindow(self.travelExtrasPassengerInfoWindow)

    def makeReservationWindowSubmitButtonClicked(self):
        self.usingCard = self.usingCardSV.get()
        if not self.usingCard:
            messagebox.showwarning("Error","You must have a card for payment.")
            return False

        self.makeReservationWindow.destroy()
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

        # Entrys
        self.nameOnCard = StringVar()
        nameOnCardEntry = Entry(paymentInfoWindow, textvariable=self.nameOnCard,width=10)
        nameOnCardEntry.grid(row=3, column=2)

        #delete card Labels
        deleteCardNumberLabel = Label(paymentInfoWindow, text = "Card Number")
        deleteCardNumberLabel.grid(row=3,column = 3, sticky=E)

        #drop down menu
        self.deleteLastDigitOfCard= StringVar()
        self.cardNumberList = []
        self.cursor.execute("SELECT CardNum FROM PaymentInfo WHERE Username = %s", self.username)
        cardNumberTuple = self.cursor.fetchall()
        if cardNumberTuple:
            for i in cardNumberTuple:
                self.cardNumberList.append(i[0])
            deleteLastDigitOfCardOptionMenu = OptionMenu(paymentInfoWindow, self.deleteLastDigitOfCard, *self.cardNumberList)
            self.deleteLastDigitOfCard.set(i[0])
        else:
            deleteLastDigitOfCardOptionMenu = OptionMenu(paymentInfoWindow, self.deleteLastDigitOfCard, [])
        deleteLastDigitOfCardOptionMenu.grid(row = 3, column = 4,sticky=E)

        # Add card number Labels
        addCardNumberLabel = Label(paymentInfoWindow, text = "Card Number")
        addCardNumberLabel.grid(row=4,column = 1, sticky = W)

        # Entrys
        self.addCardNumber = StringVar()
        addCardNumberEntry = Entry(paymentInfoWindow, textvariable=self.addCardNumber,width=10)
        addCardNumberEntry.grid(row=4, column=2, sticky=W)

        # CVV Labels
        cvvLabel = Label(paymentInfoWindow, text = "CVV")
        cvvLabel.grid(row=5,column = 1, sticky=W)

        # CVV Entrys
        self.cvv = StringVar()
        cvvEntry = Entry(paymentInfoWindow, textvariable=self.cvv,width=20)
        cvvEntry.grid(row=5, column=2, sticky=W)

        # Expiration Date Label
        expirationDateLabel = Label(paymentInfoWindow, text = "Expiration Date")
        expirationDateLabel.grid(row=6,column = 1, sticky=W)

        # Expiration Date Entrys
        self.expirationDate = StringVar()
        self.expirationDate.set("yyyy-mm-dd")
        expirationDateEntry = Entry(paymentInfoWindow, textvariable=self.expirationDate,width=20)
        expirationDateEntry.grid(row=6, column=2,sticky=W)


        # Sumbit buttons
        paymentInfoWindowAddSubmitButton = Button(paymentInfoWindow, text="Submit Add", command=self.paymentInfoWindowAddSumbitButtonClicked)
        paymentInfoWindowAddSubmitButton.grid(row=7, column=1)
        paymentInfoWindowDeleteSubmitButton = Button(paymentInfoWindow, text="Sumbit Delete", command=self.paymentInfoWindowDeleteSumbitButtonClicked)
        paymentInfoWindowDeleteSubmitButton.grid(row=7, column=3)

        # Back button
        paymentInfoWindowBackButton = Button(paymentInfoWindow, text="Back", command=self.paymentInfoWindowBackButtonClicked)
        paymentInfoWindowBackButton.grid(row=7, column=2)

    def paymentInfoWindowAddSumbitButtonClicked(self):
        nameOnCard = self.nameOnCard.get()
        addCardNumber = self.addCardNumber.get()
        cvv = self.cvv.get()
        expirationDate = self.expirationDate.get()
        if not nameOnCard:
            messagebox.showwarning("Error", "Name on card input is empty. Please enter name on card.")
            return False
        if not addCardNumber:
            messagebox.showwarning("Error", "Card number input is empty. Please enter card number")
            return False
        if not cvv:
            messagebox.showwarning("Error", "CVV input is empty. Please enter CVV")
            return False
        if not expirationDate:
            messagebox.showwarning("Error", "Expiration date input is empty. Please enter expiration date.")
            return False
        if len(addCardNumber) != 16:
            messagebox.showwarning("Error", "Card number is not valid.")
            return False
        if len(cvv) != 3:
            messagebox.showwarning("Error", "CVV number is not valid.")
            return False
        # Verify if expiration date valid or not
        try:
            datetime.strptime(expirationDate, '%Y-%m-%d')
        except ValueError:
            messagebox.showwarning("Error", "Expiration date is not valid. (yyyy-mm-dd)")
            return False

        #Verify if the card has expired or not
        if datetime.strptime(expirationDate, '%Y-%m-%d').date() < datetime.today().date():
            messagebox.showwarning("Error", "This card has already expired.")

        isCardNumber = self.cursor.execute("SELECT * FROM PaymentInfo WHERE CardNum = %s", (addCardNumber))
        if isCardNumber:
            messagebox.showwarning("Error", "This card has been added.")
            return False
        else:
            self.cursor.execute("INSERT INTO PaymentInfo VALUES(%s, %s, %s, %s, %s)", (addCardNumber, cvv, expirationDate, nameOnCard, self.username))
        self.paymentInfoWindow.destroy()
        self.createMakeReservationWindow()
        self.buildMakeReservationWindow(self.makeReservationWindow)


    def paymentInfoWindowDeleteSumbitButtonClicked(self):
        deleteCardNumber = self.deleteLastDigitOfCard.get()
        if not deleteCardNumber:
            messagebox.showwarning("Error","You don't have any card to delete.")
            return False


        self.cursor.execute("SELECT max(Reserve.DepartureDate) FROM\
                            (Reservation JOIN Reserve ON Reservation.ReserveID = Reserve.ReserveID)\
                            WHERE Reservation.CardNum = %s AND Reservation.IsCancelled = 0",deleteCardNumber)
        latestDepartureDate = self.cursor.fetchone()
        if latestDepartureDate[0] is not None:
            if datetime.today().date() < latestDepartureDate[0]:
                messagebox.showwarning("Error","There is at least one trip in the future paid by this card.")
                return False


        self.cursor.execute("DELETE FROM PaymentInfo WHERE CardNum = %s", deleteCardNumber)
        self.paymentInfoWindow.destroy()
        self.createMakeReservationWindow()
        self.buildMakeReservationWindow(self.makeReservationWindow)

    def paymentInfoWindowBackButtonClicked(self):
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
        confirmationLabel.grid(row=1,column=1,sticky=W+E)

        reservationIDLabel = Label(confirmationWindow, text = "Reservation ID")
        reservationIDLabel.grid(row=2,column=1,sticky=W)

        # Reservation ID Entrys

        self.cursor.execute("SELECT ReserveID FROM Reservation ORDER BY ReserveID DESC LIMIT 1")
        self.reservationId = self.cursor.fetchone()[0] + 1
        self.reservationIdSV = StringVar()
        self.reservationIdSV.set(self.reservationId)
        #reservationIdEntry = Label(confirmationWindow, text = self.reservationId)
        reservationIdEntry = Entry(confirmationWindow, textvariable=self.reservationIdSV,width=20,state="readonly")
        self.cursor.execute("INSERT INTO Reservation (IsCancelled, Username, CardNum) VALUES (%s, %s, %s)", (0, self.username, self.usingCard))
        for i in self.informationList:
            self.cursor.execute("INSERT INTO Reserve VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)", (self.reservationId,i[0],i[7],i[1],i[10],i[9],i[5],i[6],0))
        reservationIdEntry.grid(row=2,column=2,sticky=W)

        # Thank you Labels
        thankYouLabel = Label(confirmationWindow, text = "Thank you for your purchase! Please save Reservation ID for your records.")
        thankYouLabel.grid(row=3,column=1,sticky=W+E)
        # back to choose functionality buttons
        confirmationWindowBackButton = Button(confirmationWindow, text="Go back to choose functionality", command=self.confirmationWindowBackButtonClicked)
        confirmationWindowBackButton.grid(row=4,column=1)

    def confirmationWindowBackButtonClicked(self):
        self.confirmationWindow.destroy()
        self.chooseFunctionalityWindow.deiconify()



#======Update Reservation Window======



    def createUpdateReservationWindow(self):
        self.updateReservationWindow =Toplevel()
        self.updateReservationWindow.title("Train Sales System")

    def buildUpdateReservationWindow(self,updateReservationWindow):

        # Update Reservation Label
        updateReservationLabel = Label(updateReservationWindow,text="Update Reservation")
        updateReservationLabel.grid(row=1, column=2, sticky=W+E)

        # Reservation ID Label
        reservationIDLabel = Label(updateReservationWindow,text="Reservation ID")
        reservationIDLabel.grid(row=2, column=1, sticky=W)

        # Reservation ID Entry
        self.updateReservationIDSV = StringVar()
        reservationIDEntry = Entry(updateReservationWindow, textvariable=self.updateReservationIDSV, width=10)
        reservationIDEntry.grid(row=2, column=2, sticky=W+E)

        # Search Button
        searchButton = Button(updateReservationWindow, text = "Search", command = self.updateReservationWindowSearchButtonClicked)
        searchButton.grid(row=2, column=3, sticky=W)

        # Back Button
        backButton = Button(updateReservationWindow, text = "Back", command = self.updateReservationWindowBackButtonClicked)
        backButton.grid(row=3, column=2, sticky=W)

    def updateReservationWindowSearchButtonClicked(self):

        self.updateReservationID = self.updateReservationIDSV.get()
        if not self.updateReservationID:
            messagebox.showwarning("Error","Please type in the reserationID you want to update.")
            return False

        haveSuchID = self.cursor.execute("SELECT ReserveID FROM Reservation WHERE ReserveID = %s and Username = %s",(self.updateReservationID,self.username))
        if not haveSuchID:
            messagebox.showwarning("Error","There is no such reservationID or this reservation is not created by you.")
            return False

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

        # Update Reservation Label
        updateReservationLabel = Label(updateReservationWindow2,text="Update Reservation")
        updateReservationLabel.grid(row=1, column=2, sticky=W+E)

#==========
        # Update Reservation Tree view
        # Build the form

        self.updateReservationTree = ttk.Treeview(updateReservationWindow2, column=("1", "2", "3", "4", "5", "6" ,"7", "8","9","10","11","12"))
        self.updateReservationTree['show'] = "headings"
        self.updateReservationTree.column("1", width = 100, anchor = "center")
        self.updateReservationTree.column("2", width = 100, anchor = "center")
        self.updateReservationTree.column("3", width = 100, anchor = "center")
        self.updateReservationTree.column("4", width = 100, anchor = "center")
        self.updateReservationTree.column("5", width = 100, anchor = "center")
        self.updateReservationTree.column("6", width = 100, anchor = "center")
        self.updateReservationTree.column("7", width = 100, anchor = "center")
        self.updateReservationTree.column("8", width = 100, anchor = "center")
        self.updateReservationTree.column("9", width = 100, anchor = "center")
        self.updateReservationTree.column("10", width = 100, anchor = "center")
        self.updateReservationTree.column("11", width = 100, anchor = "center")
        self.updateReservationTree.column("12", width = 100, anchor = "center")

        self.updateReservationTree.heading("1", text = "Train (Train Number)")
        self.updateReservationTree.heading("2", text = "Departure Date")
        self.updateReservationTree.heading("3", text = "Departure Time")
        self.updateReservationTree.heading("4", text = "Arrival Time")
        self.updateReservationTree.heading("5", text = "Duration")
        self.updateReservationTree.heading("6", text = "Departs From")
        self.updateReservationTree.heading("7", text = "Arrives At")
        self.updateReservationTree.heading("8", text = "Class")
        self.updateReservationTree.heading("9", text = "Price")
        self.updateReservationTree.heading("10", text = "Number of Baggages")
        self.updateReservationTree.heading("11", text = "Passenger Name")
        self.updateReservationTree.heading("12", text = "Times of Update")


        # Insert data into the form
        self.cursor.execute("SELECT * FROM Reserve WHERE ReserveID = %s", self.updateReservationID)
        self.updateReserveList = self.cursor.fetchall()
        self.updateReserveListFull = {}

        k = 0

        for i in self.updateReserveList:

            k = k+1
            TrainNum = i[1]
            Class = i[2]
            DepartureDate = i[3]
            PassengerName = i[4]
            NumOfBaggage = i[5]
            DepartFrom = i[6]
            ArriveAt = i[7]
            UpdateTimes = i[8]


            self.cursor.execute("SELECT departure.DepartureTime, arrival.ArrivalTime FROM\
                                (SELECT TrainNum, DepartureTime\
                                FROM Stop\
                                WHERE TrainNum = %s AND StationName = %s) departure\
                                JOIN\
                                (SELECT TrainNum, ArrivalTime\
                                FROM Stop\
                                WHERE TrainNum = %s AND StationName = %s) arrival\
                                ON departure.TrainNum = arrival.TrainNum",(TrainNum, DepartFrom, TrainNum, ArriveAt))



            row = self.cursor.fetchone()
            if not row:
                    messagebox.showwarning("Error","Reservation ID and tickets not match")




            DepartureTime = row[0]
            ArrivalTime = row[1]



            if Class == "1st Class":
                self.cursor.execute("SELECT FstClassPrice FROM TrainRoute WHERE TrainNum = %s", TrainNum)
                row = self.cursor.fetchone()
                Price = row[0]
            elif Class == "2nd Class":
                self.cursor.execute("SELECT SndClassPrice FROM TrainRoute WHERE TrainNum = %s", TrainNum)
                row = self.cursor.fetchone()
                Price = row[0]

            Duration = ArrivalTime - DepartureTime

            thisReserve = [TrainNum, DepartureDate, DepartureTime, ArrivalTime, Duration, DepartFrom, ArriveAt, Class, Price, NumOfBaggage, PassengerName, UpdateTimes]

            self.updateReservationTree.insert('',k, values = thisReserve)
            self.updateReserveListFull[k] = thisReserve

        self.updateReservationTree.grid(row = 3,column =1,columnspan=3)


#============
        # Next Button
        nextButton = Button(updateReservationWindow2, text = "Next", command = self.updateReservationWindow2NextButtonClicked)
        nextButton.grid(row=4, column=2, sticky=W+E)

        # Back Button
        backButton = Button(updateReservationWindow2, text = "Back", command = self.updateReservationWindow2BackButtonClicked)
        backButton.grid(row=4, column=1, sticky=W+E)

    def updateReservationWindow2NextButtonClicked(self):
        treeIndexString = self.updateReservationTree.focus()
        if not treeIndexString:
                messagebox.showwarning("Error", "You haven't selected the ticket you want to update.")
                return False

        treeIndex = int(treeIndexString[1:])
        self.updateReserveIndex = treeIndex

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

        # Update Reservation Label
        updateReservationLabel = Label(updateReservationWindow3,text="Update Reservation")
        updateReservationLabel.grid(row=1, column=2, sticky=W+E)


        # Current Train Ticket Label
        currentTrainTicketLabel = Label(updateReservationWindow3,text="Current Train Ticket")
        currentTrainTicketLabel.grid(row=2, column=1, sticky=W+E)

        # Current Train Ticket Treeview
        self.currentTrainTicketTree = ttk.Treeview(updateReservationWindow3, column=("1", "2", "3", "4", "5", "6" ,"7", "8","9","10","11","12"))
        self.currentTrainTicketTree['show'] = "headings"
        self.currentTrainTicketTree.column("1", width = 100, anchor = "center")
        self.currentTrainTicketTree.column("2", width = 100, anchor = "center")
        self.currentTrainTicketTree.column("3", width = 100, anchor = "center")
        self.currentTrainTicketTree.column("4", width = 100, anchor = "center")
        self.currentTrainTicketTree.column("5", width = 100, anchor = "center")
        self.currentTrainTicketTree.column("6", width = 100, anchor = "center")
        self.currentTrainTicketTree.column("7", width = 100, anchor = "center")
        self.currentTrainTicketTree.column("8", width = 100, anchor = "center")
        self.currentTrainTicketTree.column("9", width = 100, anchor = "center")
        self.currentTrainTicketTree.column("10", width = 100, anchor = "center")
        self.currentTrainTicketTree.column("11", width = 100, anchor = "center")
        self.currentTrainTicketTree.column("12", width = 100, anchor = "center")

        self.currentTrainTicketTree.heading("1", text = "Train (Train Number)")
        self.currentTrainTicketTree.heading("2", text = "Departure Date")
        self.currentTrainTicketTree.heading("3", text = "Departure Time")
        self.currentTrainTicketTree.heading("4", text = "Arrival Time")
        self.currentTrainTicketTree.heading("5", text = "Duration")
        self.currentTrainTicketTree.heading("6", text = "Departs From")
        self.currentTrainTicketTree.heading("7", text = "Arrives At")
        self.currentTrainTicketTree.heading("8", text = "Class")
        self.currentTrainTicketTree.heading("9", text = "Price")
        self.currentTrainTicketTree.heading("10", text = "Number of Baggages")
        self.currentTrainTicketTree.heading("11", text = "Passenger Name")
        self.currentTrainTicketTree.heading("12", text = "Times of Update")

        self.currentTrainTicketTree.insert('',1,values=self.updateReserveListFull[self.updateReserveIndex])

        self.currentTrainTicketTree.grid(row=2,column=1,columnspan=3)

        # New Departure Date Label
        newDepartureDateLabel = Label(updateReservationWindow3,text="New Departure Date")
        newDepartureDateLabel.grid(row=3, column=1, sticky=W+E)

        # Calendar Grid Label
        self.updateDateSV = StringVar()
        self.updateDateSV.set("yyyy-mm-dd")
        updateDateEntry = Entry(updateReservationWindow3, textvariable=self.updateDateSV,width=20)
        updateDateEntry.grid(row=3, column=2,sticky=W)


        # Search Availability Button
        searchAvailabilityButton = Button(updateReservationWindow3, text = "Search Availability", command = self.updateReservationWindow3searchAvailabilityButtonClicked)
        searchAvailabilityButton.grid(row=3, column=3, sticky=W+E)

        # Updated Train Ticket Label
        updatedTrainTicketLabel = Label(updateReservationWindow3,text="Updated Train Ticket")
        updatedTrainTicketLabel.grid(row=4, column=1, sticky=W+E)

        self.updatedTrainTicketTree = ttk.Treeview(updateReservationWindow3, column=("1", "2", "3", "4", "5", "6" ,"7", "8","9","10","11","12"))
        self.updatedTrainTicketTree['show'] = "headings"
        self.updatedTrainTicketTree.column("1", width = 100, anchor = "center")
        self.updatedTrainTicketTree.column("2", width = 100, anchor = "center")
        self.updatedTrainTicketTree.column("3", width = 100, anchor = "center")
        self.updatedTrainTicketTree.column("4", width = 100, anchor = "center")
        self.updatedTrainTicketTree.column("5", width = 100, anchor = "center")
        self.updatedTrainTicketTree.column("6", width = 100, anchor = "center")
        self.updatedTrainTicketTree.column("7", width = 100, anchor = "center")
        self.updatedTrainTicketTree.column("8", width = 100, anchor = "center")
        self.updatedTrainTicketTree.column("9", width = 100, anchor = "center")
        self.updatedTrainTicketTree.column("10", width = 100, anchor = "center")
        self.updatedTrainTicketTree.column("11", width = 100, anchor = "center")
        self.updatedTrainTicketTree.column("12", width = 100, anchor = "center")

        self.updatedTrainTicketTree.heading("1", text = "Train (Train Number)")
        self.updatedTrainTicketTree.heading("2", text = "Departure Date")
        self.updatedTrainTicketTree.heading("3", text = "Departure Time")
        self.updatedTrainTicketTree.heading("4", text = "Arrival Time")
        self.updatedTrainTicketTree.heading("5", text = "Duration")
        self.updatedTrainTicketTree.heading("6", text = "Departs From")
        self.updatedTrainTicketTree.heading("7", text = "Arrives At")
        self.updatedTrainTicketTree.heading("8", text = "Class")
        self.updatedTrainTicketTree.heading("9", text = "Price")
        self.updatedTrainTicketTree.heading("10", text = "Number of Baggages")
        self.updatedTrainTicketTree.heading("11", text = "Passenger Name")
        self.updatedTrainTicketTree.heading("12", text = "Times of Update")



        self.updatedTrainTicketTree.grid(row=5,column=1,columnspan=3)

        # Change Fee Label
        changeFeeLabel = Label(updateReservationWindow3,text="Change Fee")
        changeFeeLabel.grid(row=6, column=1, sticky=W+E)

        # Change Fee Entry
        self.changeFeeSV = StringVar()
        self.changeFeeSV.set("50")
        self.changeFeeEntry = Entry(updateReservationWindow3, textvariable=self.changeFeeSV,width=10, state="readonly")
        self.changeFeeEntry.grid(row=6, column=2, sticky=W+E)

        # Updated Total Cost Label
        updatedTotalCostLabel = Label(updateReservationWindow3,text="Updated Total Cost")
        updatedTotalCostLabel.grid(row=7, column=1, sticky=W+E)

        # Updated Total Cost Entry
        self.updatedTotalCostSV = StringVar()
        self.updatedTotalCostSV.set("0")
        self.updatedTotalCostEntry = Entry(updateReservationWindow3, textvariable=self.updatedTotalCostSV,width=10, state="readonly")
        self.updatedTotalCostEntry.grid(row=7, column=2, sticky=W+E)

        # Back Button
        backButton = Button(updateReservationWindow3, text = "Back", command = self.updateReservationWindow3BackButtonClicked)
        backButton.grid(row=8, column=1, sticky=W+E)

        # Submit Button
        submitButton = Button(updateReservationWindow3, text = "Submit", command = self.updateReservationWindow3SubmitButtonClicked)
        submitButton.grid(row=8, column=2, sticky=W+E)

        self.updateReservationWindow3searchAvailabilityButtonClickedOrNot = 0

    def updateReservationWindow3searchAvailabilityButtonClicked(self):


        if self.updateReservationWindow3searchAvailabilityButtonClickedOrNot == 1:
            self.updatedTrainTicketTree.delete(*self.updatedTrainTicketTree.get_children())

        self.updateReservationWindow3searchAvailabilityButtonClickedOrNot = 1


        # Click Find Train Button on Search Train Window:
        # Destroy Search Train Window
        # Display Select Departure Window

        self.updateDate = self.updateDateSV.get()

        try:
            datetime.strptime(self.updateDate, '%Y-%m-%d')
        except ValueError:
            messagebox.showwarning("Error", "Departure date is not valid. (yyyy-mm-dd)")
            return False

        if datetime.strptime(self.updateDate, '%Y-%m-%d').date()<(datetime.today().date()):
            messagebox.showwarning("Error","Cannot update your departure date to earlier than today.")
            return False

        if self.updateReserveListFull[self.updateReserveIndex][1]<=(datetime.today().date()+timedelta(days=1)):
            messagebox.showwarning("Error","Cannot update your depareture date one day before departure.")
            return False

        self.updatedTrainTicketTree.insert('',1,values=(self.updateReserveListFull[self.updateReserveIndex][0],self.updateDate,self.updateReserveListFull[self.updateReserveIndex][2],self.updateReserveListFull[self.updateReserveIndex][3],self.updateReserveListFull[self.updateReserveIndex][4],self.updateReserveListFull[self.updateReserveIndex][5],self.updateReserveListFull[self.updateReserveIndex][6],self.updateReserveListFull[self.updateReserveIndex][7],self.updateReserveListFull[self.updateReserveIndex][8],self.updateReserveListFull[self.updateReserveIndex][9],self.updateReserveListFull[self.updateReserveIndex][10],self.updateReserveListFull[self.updateReserveIndex][11]+1))
        self.updateReserveListNew = [self.updateReserveListFull[self.updateReserveIndex][0],self.updateDate,self.updateReserveListFull[self.updateReserveIndex][2],self.updateReserveListFull[self.updateReserveIndex][3],self.updateReserveListFull[self.updateReserveIndex][4],self.updateReserveListFull[self.updateReserveIndex][5],self.updateReserveListFull[self.updateReserveIndex][6],self.updateReserveListFull[self.updateReserveIndex][7],self.updateReserveListFull[self.updateReserveIndex][8],self.updateReserveListFull[self.updateReserveIndex][9],self.updateReserveListFull[self.updateReserveIndex][10],(self.updateReserveListFull[self.updateReserveIndex][11]+1)]

        self.updatedTotalCost = 0
        for i in range(len(self.updateReserveListFull)):
            self.updatedTotalCost = self.updatedTotalCost + self.updateReserveListFull[i+1][8] + max(0,self.updateReserveListFull[i+1][9]-2)*30

        #Apply student discount
        self.cursor.execute("SELECT Customer.IsStudent FROM (Customer JOIN Reservation ON Customer.Username = Reservation.Username) WHERE Reservation.ReserveID = %s",self.updateReservationID)
        studentStatus = self.cursor.fetchone()
        if studentStatus[0] == 1:
            self.updatedTotalCost = self.updatedTotalCost*decimal.Decimal(0.8)
            self.updatedTotalCost = round(self.updatedTotalCost,2)

        self.updatedTotalCost = self.updatedTotalCost+self.updateReserveListFull[i+1][11]*50+50


        self.updatedTotalCostSV.set(self.updatedTotalCost)


    def updateReservationWindow3BackButtonClicked(self):
        self.updateReservationWindow3.destroy()
        self.createUpdateReservationWindow2()
        self.buildUpdateReservationWindow2(self.updateReservationWindow2)

    def updateReservationWindow3SubmitButtonClicked(self):
        self.cursor.execute("SELECT IsCancelled FROM Reservation WHERE ReserveID = %s",self.updateReservationID)
        isCancelled = self.cursor.fetchone()
        if isCancelled[0] == 1:
            messagebox.showwarning("Error","This reservation is already cancelled.")
            return False

        self.cursor.execute("UPDATE Reserve SET DepartureDate = %s, UpdateTimes = %s WHERE ReserveID = %s AND TrainNum = %s",(self.updateReserveListNew[1],self.updateReserveListNew[11],self.updateReservationID,self.updateReserveListNew[0]))

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
        self.cancelReservationIDSV = StringVar()
        reservationIDEntry = Entry(cancelReservationWindow1, textvariable=self.cancelReservationIDSV, width=10)
        reservationIDEntry.grid(row=1, column=2, sticky=W+E)

        # Search Button
        searchButton = Button(cancelReservationWindow1, text="Search", command=self.cancelReservationWindow1SearchButtonClicked)
        searchButton.grid(row=1, column=3)

        # Back Button
        backButton = Button(cancelReservationWindow1, text="Back", command=self.cancelReservationWindow1BackButtonClicked)
        backButton.grid(row=2, column=2)

    def cancelReservationWindow1SearchButtonClicked(self):
        self.cancelReservationID = self.cancelReservationIDSV.get()
        if not self.cancelReservationID:
            messagebox.showwarning("Error", "Reservation ID input is empty. Please enter reservation ID.")
        isReservationID = self.cursor.execute("SELECT ReserveID FROM Reservation WHERE ReserveID = %s", self.cancelReservationID)
        if not isReservationID:
            messagebox.showwarning("Error", "The reservation ID is not valid.")
            return False
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
#==============
        self.cancelReservationTree = ttk.Treeview(cancelReservationWindow2, column=("1", "2", "3", "4", "5", "6" ,"7", "8","9","10","11","12"))
        self.cancelReservationTree['show'] = "headings"
        self.cancelReservationTree.column("1", width = 100, anchor = "center")
        self.cancelReservationTree.column("2", width = 100, anchor = "center")
        self.cancelReservationTree.column("3", width = 100, anchor = "center")
        self.cancelReservationTree.column("4", width = 100, anchor = "center")
        self.cancelReservationTree.column("5", width = 100, anchor = "center")
        self.cancelReservationTree.column("6", width = 100, anchor = "center")
        self.cancelReservationTree.column("7", width = 100, anchor = "center")
        self.cancelReservationTree.column("8", width = 100, anchor = "center")
        self.cancelReservationTree.column("9", width = 100, anchor = "center")
        self.cancelReservationTree.column("10", width = 100, anchor = "center")
        self.cancelReservationTree.column("11", width = 100, anchor = "center")
        self.cancelReservationTree.column("12", width = 100, anchor = "center")

        self.cancelReservationTree.heading("1", text = "Train (Train Number)")
        self.cancelReservationTree.heading("2", text = "Departure Date")
        self.cancelReservationTree.heading("3", text = "Departure Time")
        self.cancelReservationTree.heading("4", text = "Arrival Time")
        self.cancelReservationTree.heading("5", text = "Duration")
        self.cancelReservationTree.heading("6", text = "Departs From")
        self.cancelReservationTree.heading("7", text = "Arrives At")
        self.cancelReservationTree.heading("8", text = "Class")
        self.cancelReservationTree.heading("9", text = "Price")
        self.cancelReservationTree.heading("10", text = "Number of Baggages")
        self.cancelReservationTree.heading("11", text = "Passenger Name")
        self.cancelReservationTree.heading("12", text = "Times of Update")


        # Insert data into the form
        self.cursor.execute("SELECT * FROM Reserve WHERE ReserveID = %s", self.cancelReservationID)
        self.cancelReserveList = self.cursor.fetchall()
        self.cancelReserveListFull = {}

        k = 0

        for i in self.cancelReserveList:

            k = k+1

            TrainNum = i[1]
            Class = i[2]
            DepartureDate = i[3]
            PassengerName = i[4]
            NumOfBaggage = i[5]
            DepartFrom = i[6]
            ArriveAt = i[7]
            UpdateTimes = i[8]


            self.cursor.execute("SELECT departure.DepartureTime, arrival.ArrivalTime FROM\
                                (SELECT TrainNum, DepartureTime\
                                FROM Stop\
                                WHERE TrainNum = %s AND StationName = %s) departure\
                                JOIN\
                                (SELECT TrainNum, ArrivalTime\
                                FROM Stop\
                                WHERE TrainNum = %s AND StationName = %s) arrival\
                                ON departure.TrainNum = arrival.TrainNum",(TrainNum, DepartFrom, TrainNum, ArriveAt))



            row = self.cursor.fetchone()
            if not row:
                    messagebox.showwarning("Error","Reservation ID and tickets not match")


            DepartureTime = row[0]
            ArrivalTime = row[1]



            if Class == "1st Class":
                self.cursor.execute("SELECT FstClassPrice FROM TrainRoute WHERE TrainNum = %s", TrainNum)
                row = self.cursor.fetchone()
                Price = row[0]
            elif Class == "2nd Class":
                self.cursor.execute("SELECT SndClassPrice FROM TrainRoute WHERE TrainNum = %s", TrainNum)
                row = self.cursor.fetchone()
                Price = row[0]

            Duration = ArrivalTime - DepartureTime

            thisReserve = [TrainNum, DepartureDate, DepartureTime, ArrivalTime, Duration, DepartFrom, ArriveAt, Class, Price, NumOfBaggage, PassengerName, UpdateTimes]
            self.cancelReserveListFull[k] = thisReserve
            self.cancelReservationTree.insert('',k, values = thisReserve)

            self.cancelReservationTree.grid(row=2, column=1, columnspan=3)
#============



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


        self.cancelTotalCost = 0
        for i in range(len(self.cancelReserveListFull)):
            self.cancelTotalCost = self.cancelTotalCost + self.cancelReserveListFull[i+1][8] + max(0,self.cancelReserveListFull[i+1][9]-2)*30


        self.cursor.execute("SELECT Customer.IsStudent FROM (Customer JOIN Reservation ON Customer.Username = Reservation.Username) WHERE Reservation.ReserveID = %s",self.cancelReservationID)
        studentStatus = self.cursor.fetchone()


        if studentStatus[0] == 1:
            self.cancelTotalCost = self.cancelTotalCost*decimal.Decimal(0.8)
            self.cancelTotalCost = round(self.cancelTotalCost,2)

        self.cancelTotalCost = self.cancelTotalCost+self.cancelReserveListFull[i+1][11]*50


        self.cancelTotalCostSV = StringVar()
        self.cancelTotalCostSV.set(self.cancelTotalCost)
        cancelTotalCostEntry = Entry(cancelReservationWindow2, textvariable = self.cancelTotalCostSV, state="readonly", width=10)
        cancelTotalCostEntry.grid(row=3,column=2,sticky=W+E)




        # Date of Cancellation Entry
        self.dateOfCancellation =StringVar()
        dateOfCancellationEntry = Entry(cancelReservationWindow2, textvariable=self.dateOfCancellation, state="readonly", width=10)
        dateOfCancellationEntry.grid(row=4, column=2, sticky=W+E)

        self.dateOfCancellation.set(datetime.today().date())

        # Amount to be Refunded Entry
        self.amountToBeRefunded = StringVar()
        amountToBeRefundedEntry = Entry(cancelReservationWindow2, textvariable=self.amountToBeRefunded, state="readonly",width=10)
        amountToBeRefundedEntry.grid(row=5, column=2, sticky=W+E)


        cancelDepartureDates = []

        for i in range(len(self.cancelReserveListFull)):
            cancelDepartureDates.append(self.cancelReserveListFull[i+1][1])
        earliestDepartureDate = min(cancelDepartureDates)

        if datetime.today().date() < earliestDepartureDate - timedelta(days=7):
            refund = max(0,round(self.cancelTotalCost*decimal.Decimal(0.8)-decimal.Decimal(50),2))
            self.amountToBeRefunded.set(refund)
        elif datetime.today().date() < earliestDepartureDate - timedelta(days=1):
            refund = max(0,round(self.cancelTotalCost*decimal.Decimal(0.5)-decimal.Decimal(50),2)) #!?
            self.amountToBeRefunded.set(refund)
        else:
            self.amountToBeRefunded.set("Too late to cancel")



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
        self.cursor.execute("SELECT IsCancelled FROM Reservation WHERE ReserveID = %s",self.cancelReservationID)
        isCancelled = self.cursor.fetchone()
        if isCancelled[0] == 1:
            messagebox.showwarning("Error","This reservation is already cancelled.")
            return False

        refund = self.amountToBeRefunded.get()
        if refund == "Too late to cancel":
            messagebox.showwarning("Error","You can no longer cancel this reservation.")
            return False

        self.cursor.execute("UPDATE Reservation SET IsCancelled = 1 WHERE ReserveID = %s", self.cancelReservationID)

        self.cancelReservationWindow2.destroy()
        self.createChooseFunctionalityWindow()
        self.buildChooseFunctionalityWindow(self.chooseFunctionalityWindow)

#==========View Review Window===============

    def createViewReviewWindow(self):
        self.viewReviewWindow = Toplevel();
        self.viewReviewWindow.title("Train Sales System")

    def buildViewReviewWindow(self,viewReviewWindow):

        # View Review Label
        viewReviewLabel = Label(viewReviewWindow,text="View Review")
        viewReviewLabel.grid(row=1, column=2, sticky=W+E)

        # Train Number Label
        trainNumberLabel = Label(viewReviewWindow,text="Train Number")
        trainNumberLabel.grid(row=2, column=1, sticky=W+E)

        # Train Number Entry
        self.trainNumber = StringVar()
        trainNumberEntry = Entry(viewReviewWindow, textvariable=self.trainNumber,width=10)
        trainNumberEntry.grid(row=2, column=2, sticky=E)

        # Back Button
        backButton = Button(viewReviewWindow, text="Back", command = self.viewReviewWindowBackButtonClicked)
        backButton.grid(row=3, column=1)

        # Next Button
        nextButton = Button(viewReviewWindow, text="Next", command = self.viewReviewWindowNextButtonClicked)
        nextButton.grid(row=3, column=2)


    def viewReviewWindowBackButtonClicked(self):
        self.viewReviewWindow.destroy()
        self.chooseFunctionalityWindow.deiconify()

    def viewReviewWindowNextButtonClicked(self):
        self.viewReviewTrainNumber = self.trainNumber.get()
        if not self.viewReviewTrainNumber:
            messagebox.showwarning("Error", "Train number input is empty. Please enter train number.")
            return False
        isTrainNumber = self.cursor.execute("SELECT * FROM TrainRoute WHERE TrainNum = %s", self.viewReviewTrainNumber)
        if not isTrainNumber:
            messagebox.showwarning("Error", "Train number is not valid.")
            return False
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
        viewReviewLabel.grid(row=1, column=1, sticky=W+E, columnspan=3)

        # #View Review Treeview
        viewReviewTree = ttk.Treeview(viewReviewWindow2, column=("1", "2"))
        viewReviewTree['show'] = 'headings'
        viewReviewTree.column("1", width = 150, anchor = "center")
        viewReviewTree.column("2", width = 150, anchor = "center")
        viewReviewTree.heading("1", text = "Rating")
        viewReviewTree.heading("2", text = "Comment")

        self.cursor.execute("SELECT Comment, Rating FROM Review WHERE TrainNum = %s", self.viewReviewTrainNumber)
        reviewTuple = self.cursor.fetchall()
        reviewRatingList = []
        reviewCommentList = []

        for i in reviewTuple:
            reviewRatingList.append(i[1])
            reviewCommentList.append(i[0])

        for row in range(len(reviewRatingList)):
            viewReviewTree.insert('',row, values=(reviewRatingList[row],reviewCommentList[row]))

        viewReviewTree.grid(row=2,column=1,columnspan=3)

        #Back to Choose Functionality Button
        backToChooseFunctionalityButton = Button(viewReviewWindow2, text="Back to Choose Functionality", command = self.viewReviewWindow2BackToChooseFunctionalityButtonClicked)
        backToChooseFunctionalityButton.grid(row=3,column=1,columnspan=2,sticky=W+E)

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
        self.giveReviewTrainNumberSV = StringVar()
        trainNumberEntry = Entry(giveReviewWindow, textvariable=self.giveReviewTrainNumberSV)
        trainNumberEntry.grid(row=2, column=2, sticky=W+E)

        #Rating Label
        ratingLabel = Label(giveReviewWindow, text="Rating")
        ratingLabel.grid(row=3,column=1, sticky=W)

        #Rating Listbox
        self.giveReviewRatingSV = StringVar()
        self.giveReviewRatingSV.set("Very Good")
        ratingListbox = OptionMenu(giveReviewWindow, self.giveReviewRatingSV, "Very Good","Good", "Neutral", "Bad", "Very Bad")
        ratingListbox.grid(row=3,column=2)

        #Comment Label
        commentLabel = Label(giveReviewWindow,text="Comment")
        commentLabel.grid(row=4,column=1)

        #Comment Entry
        self.giveReviewCommentSV=StringVar()
        commentEntry=Entry(giveReviewWindow,textvariable=self.giveReviewCommentSV)
        commentEntry.grid(row=4,column=2)

        #Submit Button
        submitButton = Button(giveReviewWindow, text="Submit", command = self.giveReviewWindowSubmitButtonClicked)
        submitButton.grid(row=5,column=2,sticky=W+E)

    def giveReviewWindowSubmitButtonClicked(self):
        self.giveReviewTrainNumber = self.giveReviewTrainNumberSV.get()
        self.giveReviewComment = self.giveReviewCommentSV.get()
        self.giveReviewRating = self.giveReviewRatingSV.get()

        if not self.giveReviewTrainNumber:
            messagebox.showwarning("Error", "Train number input is empty. Please enter train number.")
            return False
        isTrainNumber = self.cursor.execute("SELECT TrainNum From TrainRoute WHERE TrainNum = %s", self.giveReviewTrainNumber)
        if not isTrainNumber:
            messagebox.showwarning("Error", "Train number is not valid. Please enter train number.")
            return False

        self.cursor.execute("INSERT INTO Review(Comment, Rating, Username, TrainNum) VALUES (%s, %s, %s, %s)", (self.giveReviewComment, self.giveReviewRating, self.username, self.giveReviewTrainNumber))
        self.giveReviewWindow.destroy()
        self.chooseFunctionalityWindow.deiconify()



#========Manager Start From Here===========
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
        viewRevenueReportTree = ttk.Treeview(viewRevenueReportWindow, column=("1", "2"))
        viewRevenueReportTree['show'] = 'headings'
        viewRevenueReportTree.column("1", width=150, anchor="center")
        viewRevenueReportTree.column("2", width=150, anchor="center")
        viewRevenueReportTree.heading("1", text="Month")
        viewRevenueReportTree.heading("2", text="Revenue")

        viewRevenueReportMonthList = []
        viewRevenueReportRevenueList = []

        TotalRevenueReportQuery = "CREATE VIEW TotalRevenueReport (Month, EarliestDate, TotalPrice, IsCancelled) AS SELECT MONTH(DepartureDate), MIN(DepartureDate), SUM((50 * UpdateTimes + IF(IsStudent = 0,(IF(Class = '1st Class', FstClassPrice, SndClassPrice) + IF(NumOfBaggage > 2, 30 * (NumOfBaggage-2), 0)), 0.8 * (IF(Class = '1st Class', FstClassPrice, SndClassPrice) + IF(NumOfBaggage > 2, 30 * (NumOfBaggage-2), 0))))) AS TotalPrice, IsCancelled FROM Reservation NATURAL JOIN Customer NATURAL JOIN Reserve NATURAL JOIN TrainRoute GROUP BY ReserveID"
        CancelledRevenueReportQuery = "CREATE VIEW CancelledRevenueReport (Month, Refund) AS SELECT Month, (CASE WHEN DATEDIFF(EarliestDate, CURDATE()) > 7 THEN 0.8 * TotalPrice - 50 WHEN (DATEDIFF(EarliestDate, CURDATE()) <= 7) AND DATEDIFF(EarliestDate, CURDATE()) >= 1 THEN 0.5 * TotalPrice -50 ELSE 0 END) AS Refund FROM TotalRevenueReport WHERE IsCancelled = 1"

        self.cursor.execute(TotalRevenueReportQuery)
        self.cursor.execute(CancelledRevenueReportQuery)
        self.cursor.execute("SELECT MONTHNAME(STR_TO_DATE(T.Month, '%m')), SUM(T.Revenue) FROM (SELECT Month AS Month,TotalPrice AS Revenue FROM TotalRevenueReport UNION ALL SELECT Month AS Month, (-1) * GREATEST(Refund, 0) AS Revenue FROM CancelledRevenueReport) AS T GROUP BY T.Month ORDER BY T.Month LIMIT 3")

        totalRevenue = self.cursor.fetchall()
        for i in totalRevenue:
            viewRevenueReportMonthList.append(i[0])
            viewRevenueReportRevenueList.append(i[1])

        self.cursor.execute('DROP VIEW TotalRevenueReport')
        self.cursor.execute('DROP VIEW CancelledRevenueReport')

        for row in range(len(totalRevenue)):
            viewRevenueReportTree.insert('', row, values=(viewRevenueReportMonthList[row], viewRevenueReportRevenueList[row]))
        viewRevenueReportTree.grid(row=2,column=1,columnspan=3)

# ### Final SQL code
# CREATE VIEW TotalRevenueReport (Month, EarliestDate, TotalPrice, IsCancelled, ReserveID) AS SELECT
#     MONTHNAME(DepartureDate),
#     MIN(DepartureDate),
#     SUM((50 * UpdateTimes + IF(IsStudent = 0,(IF(Class = '1st Class', FstClassPrice, SndClassPrice) + IF(NumOfBaggage > 2, 30 * (NumOfBaggage-2), 0)), 0.8 * (IF(Class = '1st Class', FstClassPrice, SndClassPrice) + IF(NumOfBaggage > 2, 30 * (NumOfBaggage-2), 0))))) AS TotalPrice, IsCancelled, ReserveID
# FROM Reservation NATURAL JOIN Customer NATURAL JOIN Reserve NATURAL JOIN TrainRoute
# GROUP BY ReserveID

# ### Final SQL code
# CREATE VIEW CancelledRevenueReport (Month, Refund, ReserveID) AS SELECT
#     Month,
#     (
#     CASE
#         WHEN DATEDIFF(EarliestDate, CURDATE()) > 7 THEN 0.8 * TotalPrice - 50
#         WHEN (DATEDIFF(EarliestDate, CURDATE()) <= 7) AND DATEDIFF(EarliestDate, CURDATE()) >= 1 THEN 0.5 * TotalPrice -50
#         ELSE 0
#     END) AS Refund, ReserveID
# FROM TotalRevenueReport
# WHERE IsCancelled = 1

# Example:
# 100+115+30=245 30 per baggage
# 245*0.8=196 student
# 196+50=246 update fee
# 246*0.8-50=146.8 refund T > 7 days
# 246*0.5-50=73 refund 1 day < T < 7 days

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
        viewPopularRouteReportTree = ttk.Treeview(viewPopularRouteReportWindow, column=("1", "2", "3"))
        viewPopularRouteReportTree['show'] = 'headings'
        viewPopularRouteReportTree.column("1", width=150, anchor="center")
        viewPopularRouteReportTree.column("2", width=150, anchor="center")
        viewPopularRouteReportTree.column("3", width=150, anchor="center")
        viewPopularRouteReportTree.heading("1", text="Month")
        viewPopularRouteReportTree.heading("2", text="Train Number")
        viewPopularRouteReportTree.heading("3", text="# of Reservations")

        self.cursor.execute("CREATE VIEW PopularRouteReport (Date, TrainNum, NumOfReservation) AS SELECT DepartureDate, TrainNum, COUNT(ReserveID) AS ReserveNum FROM Reservation NATURAL JOIN Reserve WHERE isCancelled = 0 GROUP BY TrainNum, MONTH(DepartureDate) ORDER BY MONTH(DepartureDate) ASC, ReserveNum DESC")
        viewPopularRouteReportMonthList = []
        viewPopularRouteReportTrainNumList = []
        viewPopularRouteReportNumOfReservationList = []

        currentYear = datetime.today().year

        monthCount = 0
        for i in range(1,13):
            if (i < 10):
                month = '0' + str(i)
            else:
                month = str(i)
            self.cursor.execute("SELECT MONTHNAME(Date), TrainNum, NumOfReservation FROM PopularRouteReport WHERE STRCMP(substring(Date,1,4),%s) = 0 AND STRCMP(substring(Date,6,2),%s)= 0 LIMIT 3", (currentYear, month))
            result = self.cursor.fetchall()
            if(len(result)!=0):
                monthCount = monthCount + 1
                if(monthCount == 4): # show 4-1=3 month only
                    break
            for i in result:
                viewPopularRouteReportMonthList.append(i[0])
                viewPopularRouteReportTrainNumList.append(i[1])
                viewPopularRouteReportNumOfReservationList.append(i[2])


        self.cursor.execute('DROP VIEW PopularRouteReport')

        for row in range(len(viewPopularRouteReportMonthList)):
             viewPopularRouteReportTree.insert('',row, values=(viewPopularRouteReportMonthList[row], viewPopularRouteReportTrainNumList[row], viewPopularRouteReportNumOfReservationList[row]))

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


#--------------------Database Connection-----------------
    def connect(self):
        try:
            db = pymysql.connect(host = 'academic-mysql.cc.gatech.edu',
                                 db = 'cs4400_Team_20', user = 'cs4400_Team_20', passwd = 'rWL22HuB')
            return db
        except:
            messagebox.showwarning('Error!','Cannot connect. Please check your internet connection.')
            return False

a=GTTrain()
a.db.close()
