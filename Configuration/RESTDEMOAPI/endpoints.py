from datetime import datetime, timezone
from urllib.parse import quote

from Utility.miscUtils import miscUtils


class Endpoints:

    GetUWLID ="api/config/"
    AccountPermissions = "api/Account/permissions"
    ResetPassword = "api/Account/ResetPassword"
    AppLaunch = "api/Account/app/launch"
    CloseApp = "api/Account/app/close"
    Logout = "api/account/logOut?app=Admin"
    UpdateToken = "api/Account/UpdateToken"
    AnalyticsAccess = "api/Analytics/?from=2025-01-03&to=2025-07-03&timeRange=yesterday&timeFrame=Hour&count=10"
    Speedometer = "api/Analytics/Speedometer"
    Odometer = "api/Analytics/Odometer"

    DropdownUsers ="api/Analytics/dictionary/users"
    DropdownLocations ="api/Analytics/dictionary/locations"

    @staticmethod
    def Audit(page=1, pageSize=10):
        today = datetime.now(timezone.utc).date()
        filter_by_raw = f"from={today} 00:00:00Z,to={today} 23:59:00Z"
        filter_by = quote(filter_by_raw)
        return f"api/Audit?page={page}&pageSize={pageSize}&filterBy={filter_by}"

    Dispatcherlogs = "api/DispatcherLogs?page=1&pageSize=10&filterBy=logLevel%3DDEBUG&sortBy=viewer%3Dtrue"
    DoctorLayout = "api/DoctorLayout?page=1&pageSize=10&filterBy=name%3De&sortBy=isDefault%3Dtrue"
    DoctorLayoutRead ="api/DoctorLayout/2"
    DoctorLayoutCreate = "api/DoctorLayout"
    DoctorLayoutEdit = "api/DoctorLayout/3"
    DoctorLayoutDelete = "api/DoctorLayout/3"
    DoctorLayoutWrongData = "api/DoctorLayout/aed"
    DoctorLayoutCheck = "api/DoctorLayout/check?users=9c890e8f-a683-4de1-b803-b811757a684c&groups=06cca862-43d9-ef11-bc31-00505690d83d&roles=2af2a824-ee5a-4f4e-9598-a43d5d3dc401"
    DoctorLayoutApply = "api/DoctorLayout/apply"
    DoctorLayoutDefault = "api/DoctorLayout/default"
    ExamCodeView = "api/ExamCode?page=1&pageSize=10"
    ExamCodeCreate = "api/ExamCode"
    ExamCodeEditOrDelete = "api/ExamCode/MDAyLXRlc3Q="
    WrongExamCodeEditOrDelete = "api/ExamCode/DLXRlc3Q"

    ConfigControllerViewWithJson ="api/Config/app/AdminWeb/json"
    ConfigControllerView ="api/Config"

    FolderModuleView ="api/Folder?page=1&pageSize=10"
    FolderView = "api/Folder/4f9be7f3-342a-f011-bc51-00505690d83d"
    FolderCreate = "api/Folder"

    GeographyModuleView ="api/State?page=1&pageSize=100"
    GeographyView = "api/State/0699c005-0ea4-f011-bc3f-00505690f079"
    GeographyCreate = "api/State"

    GroupModuleView = "api/Group?page=1&pageSize=100"
    GroupView = "api/Group/06cca862-43d9-ef11-bc31-00505690d83d"
    GroupCreate = "api/Group"
    GroupUsers = "api/Group/06cca862-43d9-ef11-bc31-00505690d83d/Users?page=1&pageSize=100"
    GroupWorklist = "api/Group/06cca862-43d9-ef11-bc31-00505690d83d/Worklists?page=1&pageSize=100"

    InsuranceCodeModuleView = "api/InsuranceCode?page=1&pageSize=100"
    InsuranceCodeView = "api/InsuranceCode/VGVzdDE="
    InsuranceCodeCreate = "api/InsuranceCode"

    LauncherModuleView = "api/Launcher?page=1&pageSize=100"
    LauncherView = "api/Launcher/AdvancedVisualization"
    LauncherCreate = "api/Launcher"
    LauncherEdit = "api/Launcher/APIAutomation"

    LauncherFilterModuleView = "api/LauncherFilter?page=1&pageSize=100"
    LauncherFilterView = "api/LauncherFilter/edea7e54-faa7-f011-bc41-00505690f079"
    LauncherFilterCreate = "api/LauncherFilter"
    LauncherFilterEdit = "api/Launcher/APIAutomation"

    ModalityModuleView = "api/Modality?page=1&pageSize=100"
    ModalityView = "api/Modality/RlM="
    ModalityCreate = "api/Modality"

    PhysiciansModuleView = "api/Physician?page=1&pageSize=100"
    PhysiciansView = "api/Physician/aa33ad28-a63f-f011-bc5c-00505690d83d"
    PhysiciansCreate = "api/Physician"

    PriorityModuleView = "api/Priority?page=1&pageSize=100"
    PriorityView = "api/Priority/U1RBVA=="
    PriorityCreate = "api/Priority"

    RoleModuleView = "api/Role?page=1&pageSize=100"
    RoleView = "api/Role/2af2a824-ee5a-4f4e-9598-a43d5d3dc401"
    RoleCreate = "api/Role"
    RoleReset = "api/role/resetclaims/9eff8915-0f9d-4dc3-a2a4-7f9c89c8c214"

    ClaimsViewAdmin = "api/Role/2af2a824-ee5a-4f4e-9598-a43d5d3dc401"
    ClaimsViewSchedular = "api/Role/78fc1149-304c-4758-a8c7-6cdfc58b301e"
    ClaimsViewTechnologist= "api/Role/9eff8915-0f9d-4dc3-a2a4-7f9c89c8c214"
    ClaimsViewApiAdmin = "api/Role/c2952164-8874-4077-af62-ef349372c8b3"
    ClaimsViewOptimizerAdmin = "api/Role/c36a84e5-e058-4eef-98ad-4129fc743701"
    ClaimsImaginingProvider = "api/Role/f25bb983-80cc-417c-b61c-eea9a6466306"

    subspecialtyModuleView = "api/Subspecialty?page=1&pageSize=100"
    subspecialtyView = "api/Subspecialty/85195493-54fe-ef11-bc40-00505690d83d"
    subspecialtyCreate = "api/Subspecialty"

    ############################################################
    #              NilRead 25 Bookmark Endpoints               #
    ############################################################

    BookmarkView = "api/Bookmark"
    BookmarkForget = "api/Bookmark/forget"





