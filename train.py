from tkinter import *
import pymysql
from tkinter import messagebox

class GTTrain:
    def __init__(self):
        #Connect to the database
        #self.db = self.connect()
        #self.cursor = self.db.cursor()
        # Login Window
        self.loginWindow = Tk()
        self.loginWindow.title("Train Sales System")
        self.buildLoginWindow(self.loginWindow)
        self.loginWindow.mainloop()
        
    def buildLoginWindow(self, loginWindow):
        # Buttons
        loginButton = Button(loginWindow, text="Login", command=self.loginClicked)
        loginButton.grid(row=6, column=3)

        registerButton = Button(loginWindow, text="Register", command=self.registerClicked)
        registerButton.grid(row=6, column=4, sticky=E)

        # Login Label
        loginLabel = Label(loginWindow, text="Login")
        loginLabel.grid(row=1, column=3, sticky=W)

          
        # Username Label
        usernameLabel = Label(loginWindow, text="Username")
        usernameLabel.grid(row=2, column=2, sticky=W)
        # Username Entry
        self.username = StringVar()
        usernameEntry = Entry(loginWindow, textvariable=self.username, width=20)
        usernameEntry.grid(row=2, column=3, sticky=W + E)

        # Password Label
        passwordLabel = Label(loginWindow, text="Password")
        passwordLabel.grid(row=4, column=2, sticky=W)
        # Password Entry
        self.password = StringVar()
        passwordEntry = Entry(loginWindow, textvariable=self.password, show = '*', width=20)
        passwordEntry.grid(row=4, column=3, sticky=W + E)

    # Switch from the login window to the guest menu window
    
    def loginClicked(self):
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
 

    def buildRegisterWindow(self,registerWindow):
        # Button
        createButton = Button(registerWindow, text="Create", command=self.createClicked)
        createButton.grid(row=6, column=3)

        # Rigestration Label
        rigestrationLabel = Label(registerWindow, text="New User Registration")
        rigestrationLabel.grid(row=1, column=3, sticky=W)

        # Username Label
        usernameLabel = Label(registerWindow, text="Username")
        usernameLabel.grid(row=2, column=2, sticky=W)
        # Username Entry
        self.username = StringVar()
        usernameEntry = Entry(registerWindow, textvariable=self.username, width=20)
        usernameEntry.grid(row=2, column=3, sticky=W + E)

        # Email Label
        emailLabel = Label(registerWindow, text="Email Address")
        emailLabel.grid(row=3, column=2, sticky=W)
        # Email Entry
        self.email = StringVar()
        emailEntry = Entry(registerWindow, textvariable=self.password,width=20)
        emailEntry.grid(row=3, column=3, sticky=W + E)
        # Password Label
        passwordLabel = Label(registerWindow, text="Password")
        passwordLabel.grid(row=4, column=2, sticky=W)
        # Password Entry
        self.password = StringVar()
        passwordEntry = Entry(registerWindow, textvariable=self.username,show = '*',width=20)
        passwordEntry.grid(row=4, column=3, sticky=W + E)
        # Password Comfirm Label
        confirmLabel = Label(registerWindow, text="Confirm Password")
        confirmLabel.grid(row=5, column=2, sticky=W)
        # Password Comfirm Entry
        self.confirm = StringVar()
        confirmEntry = Entry(registerWindow, textvariable=self.username,show = '*',width=20)
        confirmEntry.grid(row=5, column=3, sticky=W + E)

    def registerClicked(self):
        self.registerWindow = Tk()
        self.registerWindow.title("Train Sales System")
        self.buildRegisterWindow(self.registerWindow)
        self.loginWindow.withdraw()
        self.registerWindow.Toplevel()
    
    
    def createClicked(self):
        self.functionWindow = Tk()
        self.functionWindow.title("Train Sales System")
        self.functionalityWindow(self.functionWindow)
        self.registerWindow.withdraw()
        self.functionalityWindow(self)
    
    def functionalityWindow(self,functionWindow):
        # Title Label
        titleLabel = Label(functionWindow, text="Choose Functionality")
        titleLabel.grid(row=1, column=1, sticky=W+E)
        # Buttons
        viewButton = Button(functionWindow, text="View Train Schedule", command=self.viewTrainScheduleClicked)
        viewButton.grid(row=2, column=1)
        makeButton = Button(functionWindow, text="Mkae a new reservation", command=self.makeANewreservationClicked)
        makeButton.grid(row=3, column=1)
        updateButton = Button(functionWindow, text="Update a reservation", command=self.updateAReservationClicked)
        updateButton.grid(row=4, column=1)
        cancelButton = Button(functionWindow, text="Cancel a reservation", command=self.cancelAReservationClicked)
        cancelButton.grid(row=5, column=1)
        giveButton = Button(functionWindow, text="Give a review", command=self.giveAReviewClicked)
        giveButton.grid(row=6, column=1)
        addButton = Button(functionWindow, text="Add school information(student discount)", command=self.addSchoolInformationClicked)
        addButton.grid(row=7, column=1)
        logoutButton = Button(functionWindow, text="Log out", command=self.logoutoutbuttonClicked)
        logoutButton.grid(row=8, column=2,sticky=E)

    def viewTrainScheduleClicked(self):
        self.functionaWindow.withdraw()
    
    def makeANewreservationClicked(Self):
        self.functionWindow.withdraw()

    def updateAReservationClicked(self):
        self.functionWindow.withdraw()

    def cancelAReservationClicked(self):
        self.functioWindow.withdraw()
    
    def giveAReviewClicked(self):
        self.functionWindow.withdraw()

    def addSchoolInformationClicked(self):
        self.functionWindow.withdraw()
        self.addSchoolInfoWindow = Tk()
        self.addSchoolInfoWindow.title("Train Sales System")
        self.buildAddSchoolInfoWindow(self.addSchoolInfoWindow)
        self.addSchoolInfoWindow.Toplevel()

    def logoutoutbuttonClicked(self):
        self.functionWindow.withdraw()

    def buildAddSchoolInfoWindow(self,addSchoolInfoWindow):
        # Title Label
        titleLabel = Label(addSchoolInfoWindow, text="Add School Info")
        titleLabel.grid(row=1, column=1, sticky=W+E)
        #School Email Address
        schoolemailLabel = Label(addSchoolInfoWindow, text="School Email Address")
        schoolemailLabel.grid(row=2, column=1, sticky=W)
        #School Email Entry
        self.schoolemail = StringVar()
        schoolemailEntry = Entry(addSchoolInfoWindow, textvariable=self.password, width=20)
        schoolemailEntry.grid(row=2, column=2, sticky=E)
        # Text Label
        textLabel =  Label(addSchoolInfoWindow,text=" Your school email address ends with edu.")
        textLabel.grid(row=3, column=1, sticky=W)
        # Buttons
        backButton = Button(addSchoolInfoWindow, text="Back", command=self.backButtonClicked)
        backButton.grid(row=4, column=1)
        submitButton = Button(addSchoolInfoWindow, text="Submit", command=self.submitButtonClicked)
        submitButton.grid(row=4, column=2,sticky=E)


    def backButtonClicked(self):
        self.addschoolInfoWindow.withdraw()
        self.functionWindow.Toplevel()

    def submitButtonClicked(self):
        self.addSchoolInfoWindow.withdraw()
        

 

    
    def buildviewschedule(self):
        self.addschoolInfoWindow.withdraw()
        seld.viewScheduleWindow = Tk()
        self.viewScheduleWindow.title("Title Sales System")
        

        
        
    
    
a=GTTrain()
