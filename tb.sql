USE [AboutUsDB]
GO
ALTER TABLE [dbo].[AboutUs_Records] DROP CONSTRAINT [FK_AboutUs_Records_AboutUs_OfficeContacts]
GO
ALTER TABLE [dbo].[AboutUs_OfficeExperts] DROP CONSTRAINT [FK_AboutUs_OfficeExperts_AboutUs_OfficeContacts]
GO
ALTER TABLE [dbo].[AboutUs_OfficeContacts] DROP CONSTRAINT [FK_AboutUs_OfficeContacts_AboutUs_OfficeContacts]
GO
ALTER TABLE [dbo].[AboutUs_Contacts] DROP CONSTRAINT [FK_AboutUs_Contacts_AboutUs_OfficeContacts]
GO
ALTER TABLE [dbo].[AboutUs_Contacts] DROP CONSTRAINT [FK_AboutUs_Contacts_AboutUs_ContactTypes]
GO
/****** Object:  Table [dbo].[AboutUs_Records]    Script Date: 11/14/2021 12:02:29 PM ******/
DROP TABLE [dbo].[AboutUs_Records]
GO
/****** Object:  Table [dbo].[AboutUs_OfficeExperts]    Script Date: 11/14/2021 12:02:29 PM ******/
DROP TABLE [dbo].[AboutUs_OfficeExperts]
GO
/****** Object:  Table [dbo].[AboutUs_OfficeContacts]    Script Date: 11/14/2021 12:02:29 PM ******/
DROP TABLE [dbo].[AboutUs_OfficeContacts]
GO
/****** Object:  Table [dbo].[AboutUs_ContactTypes]    Script Date: 11/14/2021 12:02:29 PM ******/
DROP TABLE [dbo].[AboutUs_ContactTypes]
GO
/****** Object:  Table [dbo].[AboutUs_Contacts]    Script Date: 11/14/2021 12:02:29 PM ******/
DROP TABLE [dbo].[AboutUs_Contacts]
GO
/****** Object:  User [TVEDC\h.mahmoodzadeh]    Script Date: 11/14/2021 12:02:29 PM ******/
DROP USER [TVEDC\h.mahmoodzadeh]
GO
USE [master]
GO
/****** Object:  Database [AboutUsDB]    Script Date: 11/14/2021 12:02:29 PM ******/
DROP DATABASE [AboutUsDB]
GO
/****** Object:  Database [AboutUsDB]    Script Date: 11/14/2021 12:02:29 PM ******/
CREATE DATABASE [AboutUsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AboutUsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AboutUsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AboutUsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AboutUsDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AboutUsDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AboutUsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AboutUsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AboutUsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AboutUsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AboutUsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AboutUsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AboutUsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AboutUsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AboutUsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AboutUsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AboutUsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AboutUsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AboutUsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AboutUsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AboutUsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AboutUsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AboutUsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AboutUsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AboutUsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AboutUsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AboutUsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AboutUsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AboutUsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AboutUsDB] SET RECOVERY FULL 
GO
ALTER DATABASE [AboutUsDB] SET  MULTI_USER 
GO
ALTER DATABASE [AboutUsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AboutUsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AboutUsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AboutUsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AboutUsDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AboutUsDB', N'ON'
GO
ALTER DATABASE [AboutUsDB] SET QUERY_STORE = OFF
GO
USE [AboutUsDB]
GO
/****** Object:  User [TVEDC\h.mahmoodzadeh]    Script Date: 11/14/2021 12:02:29 PM ******/
CREATE USER [TVEDC\h.mahmoodzadeh] FOR LOGIN [TVEDC\h.mahmoodzadeh] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [TVEDC\h.mahmoodzadeh]
GO
/****** Object:  Table [dbo].[AboutUs_Contacts]    Script Date: 11/14/2021 12:02:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AboutUs_Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssistantId] [int] NULL,
	[ContactTypeId] [int] NULL,
	[ContactTypeValue] [nvarchar](256) NULL,
 CONSTRAINT [PK_AboutUs_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AboutUs_ContactTypes]    Script Date: 11/14/2021 12:02:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AboutUs_ContactTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
 CONSTRAINT [PK_AboutUs_ContactTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AboutUs_OfficeContacts]    Script Date: 11/14/2021 12:02:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AboutUs_OfficeContacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OfficeName] [nvarchar](256) NULL,
	[Manager] [nvarchar](256) NULL,
	[BirthDate] [nvarchar](256) NULL,
	[Role] [nvarchar](256) NULL,
	[DegreeOfEducation] [nvarchar](256) NULL,
	[Duties] [nvarchar](max) NULL,
	[AssistantId] [int] NULL,
	[Avatar] [nvarchar](256) NULL,
 CONSTRAINT [PK_AboutUs_OfficeContact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AboutUs_OfficeExperts]    Script Date: 11/14/2021 12:02:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AboutUs_OfficeExperts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssistantId] [int] NULL,
	[Name] [nvarchar](256) NULL,
	[Role] [nvarchar](256) NULL,
	[Contact] [nvarchar](256) NULL,
 CONSTRAINT [PK_AboutUs_OfficeExpert] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AboutUs_Records]    Script Date: 11/14/2021 12:02:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AboutUs_Records](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssistantId] [int] NULL,
	[Name] [nvarchar](256) NULL,
	[Years] [nvarchar](256) NULL,
 CONSTRAINT [PK_AboutUs_Record] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AboutUs_Contacts] ON 

INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (59, 31, 1, N'میدان شهدا- خیابان 17 شهریور شمالی- جنب مترو- شرکت توزیع نیروی برق استان تهران - ساختمان شماره یک')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (60, 12, 1, N'تهران میدان شهدا شرکت توزیع نیروی برق استان تهران')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (61, 6, 1, N'تهران میدان شهدا شرکت توزیع نیروی برق استان تهران')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (62, 2, 2, N'em.ostan.tehran@tvedc.ir')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (63, 4, 2, N'ict@tvedc.ir
')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (64, 5, 2, N'tahghighat@tvedc.ir
')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (65, 12, 3, N'...')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (66, 1, 4, N'021-33310296')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (67, 2, 4, N'021-35081231')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (68, 3, 4, N'021-33342788
')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (69, 4, 4, N'021-33316234
')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (70, 5, 4, N'021-35081384
')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (71, 10, 4, N'021-33349008')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (72, 7, 4, N'021-33342522')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (73, 12, 4, N'021-33339269')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (74, 13, 4, N'021-33338796')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (75, 14, 4, N'021-35081320')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (76, 15, 4, N'021-35081394')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (77, 16, 4, N'021-33349011')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (78, 17, 4, N'021-33654020')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (79, 18, 4, N'021-33341364')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (80, 19, 4, N'021-33652930')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (81, 20, 4, N'021-33654020')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (82, 21, 4, N'021-33330055')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (83, 23, 4, N'021-35081250')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (84, 24, 4, N'021-33341872')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (85, 25, 4, N'021-35081361')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (86, 26, 4, N'021-33341131')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (87, 27, 4, N'021-35081358')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (88, 28, 4, N'021-33349049')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (89, 29, 4, N'021-33254071')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (90, 30, 4, N'021-33316232')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (91, 9, 4, N'021-35081224')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (92, 31, 4, N'021-33342247')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (93, 8, 5, N'35081281')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (94, 22, 5, N'02133654020
')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (95, 6, 5, N'02133342022
')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (96, 1, 6, N'021-33310296')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (97, 2, 6, N'021-35081229')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (98, 3, 6, N'021-35081229
')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (99, 5, 6, N'021-35081384
')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (100, 12, 6, N'021-33797744')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (101, 31, 6, N'021-35081222')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (102, 4, 7, N'021-33342022
')
INSERT [dbo].[AboutUs_Contacts] ([Id], [AssistantId], [ContactTypeId], [ContactTypeValue]) VALUES (103, 2, 8, N'تهران-خ 17شهریور، بالاتر از میدان شهدا، مقابل خ شهیدان برادران کفایی امانی-1714613136')
SET IDENTITY_INSERT [dbo].[AboutUs_Contacts] OFF
SET IDENTITY_INSERT [dbo].[AboutUs_ContactTypes] ON 

INSERT [dbo].[AboutUs_ContactTypes] ([Id], [Name]) VALUES (1, N'آدرس پستی')
INSERT [dbo].[AboutUs_ContactTypes] ([Id], [Name]) VALUES (2, N'ایمیل')
INSERT [dbo].[AboutUs_ContactTypes] ([Id], [Name]) VALUES (3, N'پست الکترونیکی')
INSERT [dbo].[AboutUs_ContactTypes] ([Id], [Name]) VALUES (4, N'شماره تلفن')
INSERT [dbo].[AboutUs_ContactTypes] ([Id], [Name]) VALUES (5, N'شماره تماس')
INSERT [dbo].[AboutUs_ContactTypes] ([Id], [Name]) VALUES (6, N'شماره فکس')
INSERT [dbo].[AboutUs_ContactTypes] ([Id], [Name]) VALUES (7, N'فکس
')
INSERT [dbo].[AboutUs_ContactTypes] ([Id], [Name]) VALUES (8, N'نشانی پستی')
SET IDENTITY_INSERT [dbo].[AboutUs_ContactTypes] OFF
SET IDENTITY_INSERT [dbo].[AboutUs_OfficeContacts] ON 

INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (1, N'دفتر برنامه ریزی و بودجه', N'محمد حسین صانعی', N'1352', N'سمت مدیر دفتر برنامه ریزی و بودجه', N'کارشناسی ارشد مهندسی برق -قدرت', NULL, 6, NULL)
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (2, N'دفتر بازار برق', N'محمد محمدی نیا', N'1359', N'مدير دفتر بازار برق', N'کارشناسی ارشد مهندسی برق -قدرت', N'<table border="0" cellpadding="0" cellspacing="0" dir="RTL" style="border-collapse:
 collapse;width:639pt" width="852">
                    <colgroup>
                        <col style="mso-width-source:userset;mso-width-alt:31158;width:639pt" width="852" />
                    </colgroup>
                    <tr height="35">
                        <td class="xl66" dir="RTL" height="35" width="852">تعيين استراتژي ها و اهداف بازار برق منطبق بر استراتژي هاي كلان سازمان</td>
                    </tr>
                    <tr height="33">
                        <td class="xl66" dir="RTL" height="33">برنامه ريزي در جهت ارتقاء و گسترش بازار برق با در نظر گرفتن استراتژي هاي سازمان</td>
                    </tr>
                    <tr height="33">
                        <td class="xl66" dir="RTL" height="33">هدايت و نظارت بر وقايع بازار برق از طريق اطلاعيه ها و تعامل با كارشناسان مديريت شبكه</td>
                    </tr>
                    <tr height="33">
                        <td class="xl66" dir="RTL" height="33">رصد نمودن آخرين تغييرات و مطالعه و اشراف كامل به آيين نامه ها، دستورالعمل ها و رويه هاي بازار برق صادره از مديريت شبكه و هيئت تنظيم بازار برق</td>
                    </tr>
                    <tr height="33">
                        <td class="xl66" dir="RTL" height="33">تهيه و ارائه گزارش هاي روزانه ماهانه و سالانه از وضعيت پارامترهاي شبكه ، انرژي تحويلي و تبادلي و عملكرد بازار برق به ذينفعان</td>
                    </tr>
                    <tr height="33">
                        <td class="xl66" dir="RTL" height="33">محاسبه و پايش شاخص هاي بازار برق (شاخص هاي عملكرد فني و اقتصادي) و ارائه گزارش های دوره اي به مديريت ارشد</td>
                    </tr>
                    <tr height="33">
                        <td class="xl67" dir="RTL" height="33" width="852">پيش بيني نياز مصرف روزانه و ارائه راهكار جهت پيش بيني دقيق تر نياز مصرف در راستای كاهش جرايم و افزايش تشويق</td>
                    </tr>
                    <tr height="33">
                        <td class="xl68" dir="RTL" height="33">كنترل صورتحساب هاي<span>&nbsp; </span>خريد برق از مبادی مختلف (بازار، بورس، دوجانبه و...) و نیز صورتحساب های جامع<span>&nbsp; </span>و پيگيري رفع مغايرتهاي احتمالي از طريق مراجع ذيصلاح</td>
                    </tr>
                    <tr height="33">
                        <td class="xl66" dir="RTL" height="33">پایش و قرائت کنتورهای بازار برق و محاسبه انرژی مناطق تحت پوشش<span>&nbsp;</span></td>
                    </tr>
                    <tr height="33">
                        <td class="xl66" dir="RTL" height="33">پایش و قرائت کنتورهای مشترکین مالک نیروگاه فتوولتائیک با ظرفیت کمتر از 100 کیلووات<span>&nbsp;</span></td>
                    </tr>
                    <tr height="33">
                        <td align="right" class="xl65" dir="RTL" height="33">رصد نمودن آخرین تغییرات بازار معاملات برق بورس انرژی و انجام معامله بر اساس استراتژی های سودآور</td>
                    </tr>
                    <tr height="33">
                        <td class="xl66" dir="RTL" height="33">مطالعات اقتصادي بازار (مانيتورينگ مداوم سود و زيان) و قيمت دهي انرژي براي بورس برق</td>
                    </tr>
                    <tr height="33">
                        <td align="right" class="xl65" dir="RTL" height="33">تدوین دستورالعمل و روش اجرایی جهت فعالیت های حوزه<span>&nbsp; </span>بازار برق در راستای ارتقاء سطح عملکرد و بهبود شاخص ها</td>
                    </tr>
                </table>', 6, NULL)
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (3, N'دفتر  برنامه ریزی فنی و کنترل پروژه
', N'بابک کاشانی زاده', N'1360', N'مدیر دفتر برنامه ریزی فنی', N'دانشجوی دکترا', N'<div><div dir="rtl">
	<p style="text-align: center;">
		<img alt="http://tvedc.ir/ckeditor/file-manager/file_retriever.ashx?file_id=1003" src="http://tvedc.ir/ckeditor/file-manager/file_retriever.ashx?file_id=1003" style="width: 672px; height: 598px;"></p>
	<h3 style="text-align: center;">
		معرفي دفتر برنامه‌ريزي فني و کنترل پروژه</h3>
	<p style="text-align: center;">
		<img alt="" src="http://tvedc.ir/ckeditor/file-manager/file_retriever.ashx?file_id=1006" ></p>
	<h4>
		&nbsp;اهم وظايف دفتر برنامه‌ريزي فني</h4>
	<p>
		· انجام مطالعات بار، پيش‌بيني و برنامه‌ريزي ده ساله، پنج ساله و ساليانه احداث، تقويت و توسعه شبكه</p>
	<p>
		· تعيين اولويت، هماهنگي بودجه و ابلاغ پروژه‌هاي جديد الاحداث، تقويت و توسعه شبكه</p>
	<p>
		· انجام مطالعات اقتصادي پروژه‌ها</p>
	<p>
		· انجام مطالعات سيستم (پخش بار و اتصال كوتاه و . . .) در شبكه</p>
	<p>
		· بررسي و شناخت نقاط آسيب‌پذير تأسيسات و شبكه (توزيع) و</p>
	<p>
		· مطالعه، بررسي و نظارت بر انتخاب زمين پست‌هاي فوق توزيع</p>
	<p>
		· مطالعه و تحقيق در خصوص موضوع چگالي بار</p>
	<h4>
		اهم مسئوليت‌ها</h4>
	<p>
		· پيش‌بيني ايجاد و توسعه ظرفيت شبكه برق</p>
	<p>
		· كنترل و نظارت زماني و فيزيكي اجراي پروژه‌ها</p>
	<p>
		· طراحي و برنامه‌ريزي شبكه</p>
	<p>
		· پيش‌بيني و پيگيري تامين منابع و زمين‌هاي مورد نياز توسعه شبكه</p>
	<p>
		· تعیین و برآورد حجم کالا و تجهیزات مورد نیاز توسعه شبکه</p>
	<h4>
		اهم شاخص‌هاي عملكرد</h4>
	<p>
		· استاندارد خطاي پيش‌بيني بار</p>
	<p>
		· استاندارد ولتاژ پست‌ها</p>
	<p>
		· معيارهاي كفايت و امنيت شبكه</p>
	<p>
		· مطابقت با برنامه‌هاي از قبل تدوين شده براي اجراي پروژه‌ها</p>
	<p>
		· مطابقت با ديگر استانداردهاي ذيربط</p>
	<p>
		· رعايت دستورالعمل‌ها و ابلاغيه‌هاي صادره از سوي مراجع ذيربط نظير توانير</p>
	<h4>
		ارتباطات درون و برون سازماني</h4>
	<div>
		<table dir="rtl" cellspacing="0" cellpadding="0" border="0">
			<tbody>
				<tr>
					<td width="374">
						<p>
							<strong><u>ارتباطات درون سازماني</u></strong></p>
					</td>
					<td width="265">
						<p>
							<strong><u>نوع ارتباط</u></strong></p>
					</td>
				</tr>
				<tr>
					<td width="374">
						<p>
							معاون برنامه ريزي و تحقيقات</p>
					</td>
					<td width="265">
						<p>
							خط گزارش‌دهي مستقيم</p>
					</td>
				</tr>
				<tr>
					<td width="374">
						<p>
							معاونت مهندسي و GIS</p>
					</td>
					<td width="265">
						<p>
							اخذ آمار و اطلاعات شبكه</p>
					</td>
				</tr>
				<tr>
					<td width="374">
						<p>
							دفتر بودجه</p>
					</td>
					<td width="265">
						<p>
							هماهنگي جهت پيش‌بيني بودجه</p>
					</td>
				</tr>
				<tr>
					<td width="374">
						<p>
							معاونت خدمات مشتركين</p>
					</td>
					<td width="265">
						<p>
							اعلام شرايط فني متقاضي به دفتر خدمات مشتركين</p>
					</td>
				</tr>
				<tr>
					<td width="374">
						<p>
							معاونت طرح و توسعه</p>
					</td>
					<td width="265">
						<p>
							ابلاغ پروژه‌ها و نظارت بر اجراي آنها</p>
					</td>
				</tr>
				<tr>
					<td width="374">
						<p>
							معاونت بهره‌برداري</p>
					</td>
					<td width="265">
						<p>
							هماهنگي جهت نهايي كردن طرح‌ها</p>
					</td>
				</tr>
				<tr>
					<td width="374">
						<p>
							دفتر حقوقي</p>
					</td>
					<td width="265">
						&nbsp;</td>
				</tr>
				<tr>
					<td width="374">
						<p>
							<strong><u>ارتباطات برون سازماني</u></strong></p>
					</td>
					<td width="265">
						<p>
							<strong><u>نوع ارتباط</u></strong></p>
					</td>
				</tr>
				<tr>
					<td width="374">
						<p>
							شركت توانير</p>
					</td>
					<td width="265">
						<p>
							هماهنگي جهت تصويب بودجه</p>
						<p>
							هماهنگی برآورد بار و مصرف</p>
						<p>
							هماهنگی مدیریت بدهی ها</p>
					</td>
				</tr>
				<tr>
					<td width="374">
						<p>
							استانداری تهران</p>
					</td>
					<td width="265">
						<p>
							هماهنگي در زمينه توسعه شبكه</p>
						<p>
							طرح های تامین برق رونق تولید</p>
						<p>
							اقتصاد مقاومتی</p>
					</td>
				</tr>
				<tr>
					<td width="374">
						<p>
							سازمان مدیریت و برنامه ریزی استان تهران</p>
					</td>
					<td width="265">
						<p>
							مبادله اطلاعات شبکه</p>
						<p>
							برنامه 5 ساله استان تهران</p>
					</td>
				</tr>
				<tr>
					<td width="374">
						<p>
							وزارت اقتصاد</p>
					</td>
					<td width="265">
						<p>
							بهبود فضای کسب و کار</p>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<p>
		&nbsp;</p>
</div>

            </div>', 6, NULL)
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (4, N'فن آوری اطلاعات و ارتباطات
', N'احسان مشتاق
', N'1359', N'مدیر دفتر فن آوری اطلاعات و ارتباطات
', N'دکتری تخصصی مهندسی کامپیوتر', NULL, 6, N'moshtaq.png')
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (5, N'دفتر تحقیقات
', N'ولی الله ناصری
', N'1361
', N'مدیر دفتر تحقیقات', N'دکترای تخصصی مهندسی برق قدرت
', N'<ul>
        <li>-زمينه سازي جهت تشويق و ترغيب مديران ، متخصص و كارشناسان به استفاده از شيوه هاي تبليغاتي و همايش ها به منظور شركت فعال در فعاليتهاي مطالعاتي و تحقيقاتي</li>
        <li>-تهيه و تدوين اولويتهاي تحقيقاتي با همكاري كارشناسان شركت ، مشاوران علمي پژوهشي به منظور تعيين مسير تحقيقات</li>
        <li>-برقراري ارتباط با دانشگاهها و مراكز علمي از طريق مكاتبات ، تشكيل جلسات به منظور تبادل اطلاعات و استفاده از دانش روز</li>
        <li>-همكاري با محققين جهت تعريف تصويب و اجراي پروژه هاي تحقيقاتي مورد نياز بر اساس آئين نامه تحقيقات به منظور پيشبرد امر تحقيقات</li>
        <li>-پيگيري و هماهنگي از طريق مكاتبات و تشكيل جلسات به منظور عملياتي كردن نتايج پروژه هاي تحقيقاتي پايان يافته </li>
        <li>-اخذ نتايج حاصل از عملياتي كردن پروژه هاي تحقيقاتي از واحدهاي استفاده كننده به منظور ارزيابي نتايج پروژه </li>
        <li>-تشكيل جلسات كميته تحقيقات شركت و پيگيري مصوبات</li>
        <li>-ايجاد ارتباط مستمر با كنفرانسهاي علمي از طريق مقالات تخصصي به منظور ارتقاء سطح علمي كارشناسان شركت</li>
        <li>-ارسال استانداردهاي ابلاغي وزارت نيرو به واحدهاي مربوط به منظور لحاظ نمودن در فعاليتهاي تعيين شده</li>
        <li>-پيگيري و نظارت از طريق بازديدها، و اخذ گزارشات به منظور حصول اطمينان از بكار گيري دقيق استانداردهاي ابلاغي</li>
        <li>-اهتمام بر افزایش دانش تخصصی از طریق مطالعات شخصی ، شرکت در دوره های آموزشی و مستند کردن تجربیات</li>
    </ul>', 6, NULL)
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (6, N'معاونت برنامه ریزی و بودجه', N'فرهاد ورپشتی', N'1347', N'معاون برنامه ریزی و بودجه', N'کارشناسی ارشد مهندسی برق - قدرت', NULL, NULL, N'varposhti.jpg')
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (7, N'معاونت منابع انسانی', N'مهدی سمیعی', N'1351', N'معاون', N'کارشناس برق', NULL, NULL, N'samiE.jpg')
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (8, N'دفتر سازماندهی و طبقه بندی مشاغل', N'علیرضا قاسمی', N'1353', N'مدیر', N'فوق لیسانس مهندسی برق قدرت', N'<ol style="
    line-height: 30px;
    font-size: 13px;
">
      <li>کاربینی و کار سنجی و مطالعه و همچنین جمع آوری پیشنهادات واحد های مختلف شرکت به منظور تغییرات در ساختار و تشکیالت
        جهت سازماندهی براساس وظایف و مامورت های شرکت </li>
      <li>انجام مطالعات و برسی های میدانی بمنظور تهیه و تدوین شرح شغل و شرح وظایف متناسب با ساختار و پستهای سازمانی مصوب
        شرکت اجرای بموقع صدور احکام افزایش های شورای عالی کار و ترفیع گروه و اضافه حقوق ساالنه کارکنان مرتبط .</li>
      <li>پیاده سازی مطلوب طرح طبقه بندی مشاغل و حقوق و دستمزد کارکنان که توسط شرکت توانیر بر اساس ضوابط و مقررات مصوب ابالغ
        می گردد .</li>
      <li>ارزیابی سوابق شغلی براساس ضوابط طرح طبقه بندی مشاغل بمنظور تعیین گروه شغلی مناسب.</li>
      <li>کنترل احکام صادره کارکنان بمنظور حصول اطمینان از صحت امتیازات فردی وشغلی آنان .</li>
      <li>بررسی و تطبیق سوابق خدمتی کارکنان به ویژه سوابق خارج از صنعت برق با طرح طبقه بندی مشاغل .</li>
      <li>نظارت و پیگیری بر تشکیل کمیته طبقه بندی مشاغل شرکت بمظور بررسی سوابق کارکنانی که نیاز به ارتقاء رتبه ، انتصاب و یا
        تغییر پست دارند .</li>
      <li>ارسال سوابق کارکنان به شرکت توانیر که ارتقاء گروه آنها بعد از تایید در کمیته طبقه بندی شرکت نیاز به بررسی و تصویب
        شرکت توانیر دارد .</li>
      <li>پیاده سازی سیستمها ، فرآیندها و نظام های نوین مدیریت در جهت بسط و بهبود مستمر کیفی فعالیتهای مختلف شرکت.</li>
    </ol>', 7, NULL)
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (9, N'دفتر آموزش و برنامه ریزی منابع انسانی', N'رضا منصوری یگانه', N'1355', N'مدیر', N'دکتری برق', N'"شرح وظايف :
- تدوين وپيشنهاد برنامه استراتژيك نيروي انساني سازمان ، براساس اهداف وخط ومش هاي سازمان بمنظور برنامه ريزي نيروي انساني
- بررسي وضعيت موجود نيروي انساني براساس چارت سازماني وشناسنامه شغل وشاغل بمنظور شناخت وضعيت كمي وكيفي نيروي انساني وتامل با واحدهاي ذيربط جهت توانمند سازي نيروي انساني
- نظارت بر نياز سنجي نيروي انساني براساس برنامه ريزي هاي و وضعيت كمي وكيفي موجود بمنظور حصول اطمينان از تامين نيازهاي حال وآينده سازمان
- ارائه طرحهاي تامين نيروي انساني ( از داخل وخارج ازسازمان) ويا تعديل نيرو ، براساس نياز سنجي هاي صورت گرفته ، بمنظور تامين نيازهاي حال و آينده سازمان
- نظارت برفرآيند استخدام نيروي انساني براساس دستورالعمل ها وضوابط موجود بمنظور حصول اطمينان تامين بخشي از نيروي سازماني
- نظارت برتهيه وتنظيم گزارشات آماري مورد نياز براساس درخواست واحدهاي مختلف بمنظور اطمينان از تامين اطلاعاتي واحد متقاضي
- تجزيه وتحليل آمارواطلاعات براساس اطلاعات موجود بمنظور پايش فرآيند برنامه ريزي نيروي انساني وآموزش
- نظارت برتدوين برنامه هاي آموزش بر اساس طرحهاي مراجع ذيصلاح بمنظور اطمينان از تطابق برنامه ها واستاندارد نيازها
- نظارت بر تعيين نيازهاي آموزشي براساس اهداف ونيازهاي شغل وشاغل بمنظور حصول اطمينان از تشخيص صحيح نيازهاي آموزشي سازمان
- نظارت برارزيابي وتعليم اثر بخشي دوره هاي آموزشي به منظور اطمينان از اثر بخش بودن دوره هاي آموزش ورفع نواقص احتمالي
- نظارت بر اجراي برنامه هاي آموزشي براساس برنامه تدوين شده واستاندارهاي موجود، بمنظور حصول اطمينان از تطابق برنامه ها و استاندارد نيازها
- تعيين شاخص هاي پايش فرآيندهاي برنامه ريزي نيروي انساني وآموزش براساس ضوابط واستاندارد هاي موجود بمنظور بهبود مستمر فرآيندها
- نظارت به فعاليت هاي كارآموزي بمنظور حصول اطمينان از انجام صحيح فرآيند كارآموزي وانطباق با ضوابط
- نظارت برفرآيند بازديدهاي علمي، درون وبرون سازماني ، براساس ضوابط موجود ، بمنظور حصول اطمينان از انجام صحيح فرآيند
- نظارت برفعاليت هاي مربوط به آزمون ها ، از قبيل تعيين سطح ، تائيد تسلط وتعيين مهارت بمنظور حصول اطمينان از انجام صحيح فرآيند هاي مربوط به آزمون ها
- نظارت بر ثبت سوابق آموزشي براساس روشهاي موجود وفرمهاي مربوطه به منظور حصول اطمينان از دقت وصحت اطلاعات ثبت شده
- تهيه گزارشات لازم براساس فعاليت هاي انجام شده واهداف ، نيازها ، بمنظور ارائه به واحدهاي ذيربط
- كنترل وبررسي صورت وضعيت هاي آموزش ، بمنظور تائيد صورت وضعيت وارجاع به امورمالي"
', 7, N'mans.jpg')
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (10, N'دفتر توسعه و تحول اداری', N'جمشید دیانتی', N'1344', N'مدیر', N'کارشناس ارشد مهندسی صنایع', N'اجرای برنامه‌های تحول اداری مرتبط با وظایف دفتر ،ارائه پیشنهادات لازم به منظور اصلاح و بهبود روش‌های انجام كار با همكاری واحدهای ذی ربط. ایجاد، توسعه و ترویج فرهنگ بهره‌وری 
', 7, NULL)
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (11, N'امور کارکنان و رفاه', NULL, NULL, N'مدیر', NULL, NULL, 7, NULL)
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (12, N'معاونت مهندسی و نظارت', N'حامد احمدی', N'1358', N'معاون', N'...', NULL, NULL, N'DRahmadi.jpg')
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (13, N'امور مهندسی و طراحی', N'حامد احمدی', N'1358', N'مدیر', N'دکتری برق', NULL, 12, N'DRahmadi.jpg')
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (14, N'دفتر بحران و پدافند غیر عامل و دفتر ایمنی HSE', N'حمید پدرام فر', N'1349', N'مدیر', N'کارشناسی برق قدرت از دانشگاه علم و صنعت-
کارشناسی ارشد مدیریت اجرایی از دانشگاه آزاد دماوند ', NULL, 16, N'pedramfar.jpg')
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (15, N'دفتر GIS و مكانيزاسيون شبكه', N'حسين اردكاني', NULL, N'مدیر', NULL, NULL, 12, NULL)
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (16, N'معاونت بهره برداري و ديسپاچينگ', N'یحیی شکری', N'1342', N'معاون', N'کارشناسی  مهندسی برق - قدرت', NULL, NULL, N'Shokri.jpg')
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (17, N'دفتر نظارت بر بهره برداری', N'حمیدرضا نادری', NULL, N'مدیر', NULL, NULL, NULL, NULL)
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (18, N'امور دیسپاچینگ و فوریت های برق', N'ابولقاسم کریمی', N'1349', N'مدیر', N'کارشناس برق قدرت', N'راهبری و نظارت بر فعالیت های مربوط به بهره برداری از پستهای فوق توزیع و شبکه های فشار متوسط در حوزه های پنج گانه مراکز کنترل و همچنین نظارت بر عملکرد سیستم تماس مشترکین در سامانه فوریت های برق 121 


', 16, N'akarimi.jpg')
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (19, N'دفتر ایمنی و مدیریت بحران', N'عزیز گل محمدی', NULL, N'مدیر', NULL, NULL, NULL, NULL)
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (20, N' امور خدمات فنی و مهندسی', N'علی اکرم منصور کراتی', N'1348', N'مدیر', N'کارشناس برق قدرت-کارشناسی ارشد  مدیریت دولتی مالی ', NULL, 16, N'Amansk.jpg')
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (21, N'معاونت فروش و خدمات مشترکین', N'مصطفی بابایی', N'1347', N'معاون', N'مدرک تحصیلی: کارشناس مهندسی برق و  کارشناس ارشد مدیریت اجرایی گرایش استراتژیک 			
', NULL, NULL, N'Babai.jpg')
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (22, N'دفتر نظارت بر بهره برداری', N'مهندس علمایی ', N'1363', N'معاون', N'کارشناسی ارشد برق  دانشگاه صنعتی  امیر کبیر', NULL, 16, N'olamai.jpg')
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (23, N'دفتر نظارت بر  خدمات مشترکین', N'مهدی صباغیان', NULL, N'مدیر', NULL, NULL, 21, NULL)
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (24, N'دفتر نظارت و کنترل لوازم اندازه گیری', N'امیررضا آقامحمدی', NULL, N'سرپرست', N'کارشناسی مهندسی برق - انتقال و توزیع - دانشگاه صنعت آب و برق (شهید عباسپور) <br>
کارشناسی ارشد مهندسی برق -قدرت - دانشگاه آزاد اسلامی واحد خمینی شهر <br>
دکترای مهندسی برق -قدرت دانشگاه صنعتی شیراز

', NULL, 21, N'mohammadi.jpg')
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (25, N'گروه مدیریت مصرف', N'افشین بهتویی', NULL, N'مدیر', NULL, NULL, 21, NULL)
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (26, N'معاونت مالی و پشتیبانی', N'عباس آتش پیکر', N'1348', N'معاون', N'کارشناسی ارشد مدیریت مالی', NULL, NULL, N'Atashpeykar.jpg')
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (27, N'امور مالی', N'محمدحسین محمدی', NULL, N'سرپرست', NULL, NULL, 26, NULL)
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (28, N'امور تدارکات', N'شهاب شجاعی', NULL, N'مدیر', NULL, NULL, 26, NULL)
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (29, N'امور نظارت بر خدمات عمومی', N'قادر رضوانی', N'1353
', N'مدیر', N'کارشناس ارشد مدیریت شهری
', N'کلیه امور به خدمات و پشتیبانی شرکت از قبیل نقلیه-خرید اقلام مصرفی- تاسیسات ساختمان و غیره
', 26, NULL)
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (30, N'دفتر حسابداری و نظارت بر درآمد', N'محمدرضا صلابت', NULL, N'مدیر', NULL, NULL, 26, NULL)
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (31, N'دفتر قائم مقام و معاون هماهنگی', N'قاسم شهابی', N'1347', N'قائم مقام', N'کارشناسی مهندسی برق قدرت(دانشگاه فردوسی مشهد) +  کارشناسی ارشد مهندسی صنايع – مدیریت سیستم و بهره وری (دانشگاه علوم و فنون مازندران)', NULL, NULL, N'AAR79652.jpg')
INSERT [dbo].[AboutUs_OfficeContacts] ([Id], [OfficeName], [Manager], [BirthDate], [Role], [DegreeOfEducation], [Duties], [AssistantId], [Avatar]) VALUES (33, N'', N'', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AboutUs_OfficeContacts] OFF
SET IDENTITY_INSERT [dbo].[AboutUs_OfficeExperts] ON 

INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (1, 1, N'محمد صفایی', N'کارشناس مسئول برودجه', N'35081228')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (2, 1, N'علی کاظم نیاگروی', N'کارشناس مسئول کنترل برنامه', N'33349033')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (3, 1, N'زهرا خوشکار', N'کارشناس صورت وضعیت', N'33349058')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (4, 1, N'امید فرهادی راد', N'کارشناس فهرست بهاء', N'33349058')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (5, 1, N'نجمه محمدی', N'کارشناس صورت وضعیت', N'33349033')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (6, 1, N'محمد امین سروش', N'کارشناس فهرست بهاء', N'33349058')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (7, 1, N'ریحانه بلوچی', N'مسئول دبیرخانه', N'33310296')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (8, 2, N'سارا صبرآموز', N'کارشناس مسئول مطالعات فنی و اقتصادی و تحلیل بازار برق', N'33317041')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (9, 2, N'شهره خرمی متین', N'کارشناس مسئول عملیات بازار برق', N'35081391')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (10, 2, N'مریم جهان محمدی', N'مسئول دفتر', N'35081231')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (11, 3, N'اعظم فتح اله زاده
', N'کارشناس مسئول مطالعات اقتصادی بار
', N'35081283
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (12, 3, N'رضا مومنی
', N'کارشناس طرح جامع
', N'35081234
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (13, 3, N'مهدی صفری
', N'کارشناس آمار و اطلاعات
', N'35081234
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (14, 3, N'فربد ممدوحی
', N'کارشناس سیستم جامع
', N'35081279
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (15, 3, N'مریم جهان محمدی
', N'مسئول دبیرخانه
', N'33342788
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (16, 4, N'عصمت رمضانی کالار
', N'کارشناس مسئول مطالعات ، توسعه و امنیت شبکه
', N'35081302')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (17, 4, N'امیررضا قدسی اثنی عشری
', N'کارشناس مسئول نظارت بر نرم افزارها
', N'35081240')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (18, 4, N'فاطمه خلیلی گرکانی
', N'کارشناس مسئول فن آوری اطلاعات
', N'33316237')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (19, 5, N'عین الله کرمی
', N'کارشناس تحقیقات پژوهش های فنی توزیع
', N'35081384
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (20, 22, N'کوروش زارع', N'کارشناس مسئول نظارت بر بهره برداری جنوب غرب
', N'33656040')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (21, 22, N'سید رضا هاشمی', N'کارشناس مسئول نظارت بر بهره برداری شرق
', N'33656040
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (22, 22, N'محمد مهدی سمیعی عارف
', N'کارشناس مسئول نظارت بر بهره برداری غرب
', N'33656040
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (23, 22, N'محمد علی سریار
', N'کارشناس کنترل شبکه
', N'33656040
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (24, 20, N'رضا لطفیان
', N'رئیس اداره عیب یابی، حفاظت رولیاژ
', N'33142320
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (25, 20, N'بیژن پیشگو
', N'رئیس اداره عیب یابی، حفاظت رولیاژ
کارشناس مسئول کنترل سیستمهای سامانه در امور دیسپاچینگ
', N'33656050
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (26, 20, N'بابک ردگاه
', N'کارشناس تعمیرات تخصصی تجهیزات
', N'33652939
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (27, 20, N'سید داود خبازی
', N'کارشناس مسئول حفاظت و رولیاژ
', N'33654020
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (28, 20, N'سید هاشم ترفان
', N'کارشناس اداره رولیاژ
', N'33654020
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (29, 18, N'مجتبی پورعباسعلی
', N'معاون دیسپاچینگ در حوزه مرکز
', N'35081263
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (30, 18, N'بهرام حاج میرزا محمدی
', N'معاون دیسپاچینگ در حوزه شرق
', N'76340066
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (31, 18, N'عبدالغفار سلطانی
', N'معاون دیسپاچینگ در حوزه غرب
', N'65149747
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (32, 18, N'منوچهر خسروی یکتا
', N'معاون دیسپاچینگ در حوزه جنوب غرب
', N'56695764')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (33, 18, N'محمد نفر
', N'معاون دیسپاچینگ در حوزه جنوب شرق
', N'36150072
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (34, 18, N'پروین اسماعیلی
', N'رئیس سامانه 121 و فوریت های برق
', N'35081243
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (35, 18, N'منصوره شفیعی
', N'کارشناس مسئول اتوماسیون
', N'35081292
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (36, 18, N'اسماعیل حاتم خانی
', N'کارشناس مسئول مخابرات و تله متری
', N'35081215
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (37, 29, N'ناهید رجی پور کتابی
', N'کارشناس مسئول خدمات عمومی
', N'33349005
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (38, 29, N'زهره ملازاده سیری
', N'مسئول تنظیم اسناد
', N'33349005
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (39, 29, N'محبوبه خالقی علیداش
', N'جمعدار اموال
', N'35081288')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (40, 29, N'حسن آدینائی
', N'متصدی امور اداری
', N'35081242')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (41, 14, N'اعظم یزدان دوست
', N'کارشناس مسئول حوزه hse در شما ل غرب
', N'33652930
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (42, 14, N'مریم علی مددی
', N'کارشناس مسئول حوزه hse در جنوب شرق
', N'33652930
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (43, 14, N'سید علی استیری
', N'کارشناس مسئول حوزه hse در جنوب غرب
', N'33652930
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (44, 14, N'سجاد روستا طسوجی
', N'کارشناس مسئول حوزه hse در حوزه غرب
', N'33652930
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (45, 14, N'محسن اسدی
', N'کارشناس مسئول حوزه hse در حوزه غرب
', N'33652930
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (46, 14, N'اکرم زرکشان
', N'مسئول دفتر ایمنی و بحران
', N'33652930
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (47, 14, N'اصغر ابوالقاسم پورکیا
', N'مسئول بازرسی
', N'33652930
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (48, 10, N'محمد رضا صحرایی
', N'کارشناس دفتر توسعه مدیریت
', N'35081390
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (49, 10, N'شهره خرمی متین
', N'كارشناس تحليل فرآيند و سيستم
', N'35081390
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (50, 10, N'فرزاد حق نظری
', N'كارشناس مسئول مديريت استراتژيك و كنترل پروژه هاي بهبود
', N'35081390
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (51, 10, N'فرزاد فرامرزیان
', N'کارشناس دفتر توسعه مدیریت
', N'35081349
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (52, 28, N'مریم دارینی
', N'کارشناس  قراردادها', N'35081342
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (53, 28, N'محمود بیات
', N'کارپرداز', N'35081341
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (54, 28, N'رضا عباسی قلعه سرخ
', N'کارشناس مسئول تنظیم اسناد در امور تدارکات
', N'33318591
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (55, 28, N'جلال پور مهدی
', N'کارشناس بازرگانی و انبار
', N'35081336
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (56, 28, N'مسعود فروغی
', N'کارپرداز', N'35081343
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (57, 28, N'محمدرضا یوسفی
', N'تدارکات', N'35081343
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (58, 28, N'محمد عابدی
', N'تدارکات', N'35081343
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (59, 28, N'منیژه راکی
', N'کارشناس مناقصه و قراردادها 
', N'35081338
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (60, 28, N'سید مصطفی رضوی
', N'کارپرداز', N'35081338
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (61, 28, N'اکرم اکبری 
', N'کارشناس صدوراسناد حسابداری 
', N'35081363
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (62, 28, N'محبوبه سهرابی
', N'کارشناس قراردادها و مناقصات', N'35081363
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (63, 28, N'محمدهادی خسروی مشیزی
', N'کارشناس کنترل موجودی انبارها 
', N'35081344
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (64, 28, N'جمشید ایوبی مجد
', N'کارشناس کنترل موجودی انبارها  ( خدماتی )
', N'35081345
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (65, 28, N'بنیامین صفدری
', N'کارشناس قراردادها در امور تدارکات
', N'35081364
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (66, 28, N'مریم کفایی خو
', N'کمک کارشناس 
', N'33349049
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (67, 9, N'صدیقه آقائی 
', N'کارشناس مسئول آموزش و بهینه سازی نیروی انسانی 
', N'02135081381
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (68, 9, N'محسن رحیمی کرمانی 
', N'کارشناس  آموزش و بهینه سازی نیروی انسانی 
', N'02135081381
')
INSERT [dbo].[AboutUs_OfficeExperts] ([Id], [AssistantId], [Name], [Role], [Contact]) VALUES (69, 9, N'سحر بخشی زاده 
', N'نیروی خدما ت اداری -آموزش 
', N'02135081381
')
SET IDENTITY_INSERT [dbo].[AboutUs_OfficeExperts] OFF
SET IDENTITY_INSERT [dbo].[AboutUs_Records] ON 

INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (1, 1, N'سوابق اجرائی تشخیص مصارف سنگین و دیمالندی', N'1378-1384')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (2, 1, N'کارشناس و مجری طرح منطقه برق پاکدشت', N'1384-1393')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (3, 1, N'کارشناس کنترل برنامه دفتر بودجه', N'1393-1394')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (4, 1, N'مدیر دفتر برنامه ریزی و بودجه', N'1394-تا کنون')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (5, 2, N' کارشناس تجزیه و تحلیل بار ', N'1384-1385')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (6, 2, N'کارشناس مدیریت مصرف برق', N'1385-1386')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (7, 2, N'مدير دفتر بازار برق و مديريت مصرف', N'1386-1392')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (8, 2, N'مدير دفتر بازار برق', N'1392- تاكنون')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (9, 3, N'مرکز تحقیقات نیرو - مدیر پروژه
', N'1381-1383
')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (10, 3, N'رئیس گروه نظارت و تنظیم مقررات', N'1383-1387
')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (11, 3, N'مدیر دفتر برنامه ریزی فنی
', N'1389-تاکنون
')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (12, 4, N'کارشناس تجزیه و تحلیل و سیستم های اطلاعاتی
', N'1384-1387
')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (13, 4, N'کارشناس مسئول نرم افزار
', N'1387-1390
')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (14, 4, N'کارشناس مسئول مطالعات ، توسعه و امنیت شبکه
', N'1390-1392
')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (15, 4, N'مدیر دفتر فن آوری اطلاعات و ارتباطات
', N'1392-تاکنون
')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (16, 5, N'کارشناس شرکت مخابرات ایران
', N'1382')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (17, 5, N'کارشناس مسئول بهره برداری نیروگاه کردستان
', N'1383-1388
')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (18, 5, N'مدیر مهندسی و برنامه ریزی مدیریت توزیع برق ایلام
', N'1388-1391
')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (19, 5, N'مدیر دفتر برنامه ریزی و بودجه توزیع برق استان ایلام
', N'1391-1396
')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (20, 5, N'مدیر دفتر تحقیقات توزیع برق استان تهران
', N'1398-تاکنون
')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (21, 6, N'مجری طرح خطوط', N'1381-1384')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (22, 6, N'مدیرعامل توزیع جنوب شرق', N'1384-1386')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (23, 6, N'معاون مهندسی و عضو هئیت مدیره', N'1387-1394')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (24, 6, N'معاون برنامه ریزی و بودجه', N'1394-تاکنون')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (25, 31, N'کارشناس  رله و حفاظت (ابتدای استخدام- قائم شهر)', N'1371-1372')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (26, 31, N'رئیس گروه رله و حفاظت ', N'1372-1372')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (27, 31, N'رئیس اداره حفاظت و رلیاژ', N'1372-1373')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (28, 31, N'رئیس قسمت انتقال برق شرق مازندران- گلستان فعلی', N'1373-1375')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (29, 31, N'مدير امور انتقال برق  استان گلستان', N'1375-1379')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (30, 31, N'مديريت مركز ديسپاچينگ منطقه اي شمال و با حفظ سمت سرپرست انتقال برق گلستان', N'1377-1379')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (31, 31, N'معاون فني و مهندسي و عضو اصلي هيئت مديره شركت توزيع نيروي برق غرب مازندران', N'1379-1382')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (32, 31, N'مديريت(معاون) برنامه ريزي و نظارت شركت توزيع برق استان گلستان', N'1382-1385')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (33, 31, N'معاون بهره برداري و عضو اصلي هيئت مديره شركت توزيع برق استان گلستان', N'1385-1388')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (34, 31, N'قائم مقام و عضو اصلي هيئت مديره شركت توزيع برق استان گلستان', N'1388-1389')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (35, 31, N'رئیس هیئت مدیره و مدیرعامل شرکت توزیع نیروی برق استان گلستان', N'1389-1394')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (36, 31, N'رئیس هیئت مدیره و مدیرعامل شرکت توزیع نیروی برق استان مازندران', N'1394-1398')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (37, 31, N'مشاور فنی مدیرعامل شرکت توزیع برق استان تهران', N'1398-1398')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (38, 31, N'قائم مقام و معاون هماهنگی شرکت توزیع برق استان تهران', N'1398-1399')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (47, 16, N'کارشناس کنترل شبکه', N'1368-1375')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (48, 16, N'رئیس مرکز کنترل شبکه', N'1375-1381')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (49, 16, N'مدیر امور دیسپاچینگ و فوریتهای برق', N'1381-1397')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (50, 16, N'معاون بهره برداری و دیسپاچینگ', N'1397-تاکنون')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (51, 24, N'مدیر طرحی جامع و کاهش تلفات خرم آباد، ملایر سامن', N'1383-1385')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (52, 24, N'مدیر امور برق شهرتان نطنز', N'1391-1394')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (53, 24, N'مدیر امور برق آران و بیدگل', N'1394-1395')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (54, 24, N'ریس اداره بخش رودبار و قصران', N'1396-1399')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (55, 24, N'سرپرست دفتر نظارت بر لوازم اندازه گیری', N'1399-تاکنون')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (56, 8, N'رییس اداره مهندسی برق شرق اراک', NULL)
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (57, 8, N'مسئول خط گرم توزیع استان مرکزی', NULL)
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (58, 8, N'مسئول خط گرم توزیع شمالشرق تهران', NULL)
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (59, 8, N'معاون بهره برداری برق دماوند', NULL)
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (60, 8, N'مدیر برق رودهن', NULL)
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (61, 8, N'مدیر برق پرند', NULL)
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (62, 8, N'مدیر دفتر سازماندهی و طبقه بندی مشاغل', NULL)
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (63, 21, N'معاون فروش و خدمات مشترکین توزیع برق استان تهران 
', NULL)
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (64, 21, N'مدیر دفتر لوازم اندازه گیری شرکت توزیع  برق استان تهران', NULL)
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (65, 21, N'مدیر امور خدمات فنی شرکت توزیع برق استان تهران', NULL)
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (66, 21, N'مدیر برق شهرستان های ورامین و پیشوا', NULL)
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (67, 21, N'میدر برق شرستان پردیس، بومهن و رودهن', NULL)
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (68, 21, N'معاون بهره برداری برق شهرستان دماوند', NULL)
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (69, 21, N'رئیس اداره حوادث و اتفاقات شبکه در منطقه برق تهرانپارس', NULL)
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (70, 21, N'کارشناس تجزیه و تحلیل شبکه های برق منطقه برق تهرانپارس', NULL)
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (71, 26, N'معاون مالی و پشتیبانی  ', N'1399-تاکنون')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (72, 26, N'مدیر مالی از سال ', N'1397-1399')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (73, 7, N'معاونت منابع انسانی 
', N'-')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (74, 12, N'معاونت مهندسی و نظارت ', N'-')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (75, 12, N'مدیر مهندسی و طراحی ', N'-')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (76, 12, N'مدیر دفتر GIS', N'-')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (77, 14, N'معاونت مهندسی مناطق برق افسریه - ری - کهریزک', N'1389-1392')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (78, 14, N'مسئول طرح جامع مهندسی  شرکت توزیع نیروی برق استان تهران', N'1388-1390')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (79, 14, N'رئیس مرکز طراحی شهدا', N'1390-1393')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (80, 14, N'ناظر عالیه شرکتهای پیمانکاری ', N'1393-1398')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (81, 14, N'سرپرست دفتر نظارت بر پروژه های سرمایه ای', N'1398-1399')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (82, 14, N'مدیر دفتر بحران و پدافند غیر عامل و سرپرست دفتر HSE', N'1399-تاکنون')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (83, 22, N'رئیس اداره پست ها منطقه برق شهرری ', N'1389-1392')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (84, 22, N'رئیس اداره رولیاژ و عیب یابی امور خدمات فنی ', N'1392-1395')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (85, 22, N'معاون بهره برداری منطقه برق خاوران', N'1395-1399')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (86, 22, N'سرپرست دفتر نظارت بر بهره برداری', N'1399-تا کنون')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (87, 18, N'کارشناس امور دیسپاچینگ -مرکز کنترل شبکه', N'1376-1381')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (88, 18, N'معاون بهره برداری منطقه برق تهرانپارس', N'1381-1385')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (89, 18, N' معاون مهندسی و برنامه ریزی منطقه برق تهرانپارس', N'1385-1378')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (90, 18, N'رئیس سامانه 121 و فوریتهای توزیع برق استان تهران', N'1378-1389')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (91, 18, N'مدیر امور خدمات فنی توزیع برق استان تهران', N'1389-1394')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (92, 18, N' مدیر دفتر نظارت بر بهره برداری توزیع برق استان تهران', N'1394-1399')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (93, 18, N'مدیر امور دیسپاچینگ و فوریتهای برق استان تهران', N'1399-تا کنون')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (94, 20, N'کارشناس طراحی  و مهندسی شبکه و مسئول کنترل و تایید کلیه طرح ها ', N'1377-1386')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (95, 20, N'کارشناس مسئول برداشت اطلاعات مهندسی شبکه و GIS ', N'1386-1388')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (96, 20, N'کارشناس مسئول تدوین دستورالعمل ها و استانداردها', N'1388-1391')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (97, 20, N'مدیر منطقه برق فیروزکوه', N'1391-1394')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (98, 20, N'مدیر امور مهندسی و طراحی', N'1394-1397')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (99, 20, N'دبیر کمیته فنی و بازرگانی', N'1394-1397')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (100, 20, N'مدیر امور خدمات فنی و مهندسی', N'1397-تاکنون')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (101, 29, N'دفتر حراست', N'1387-1390')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (102, 29, N'مدیر امور نظارت بر خدمات عمومی', N'1390-تاکنون')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (103, 9, N'رئیس ادراه برق پیشوا ', N'1385-1389')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (104, 9, N' مدیر برق شهرستان ورامین', N'1390-1396')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (105, 9, N' مشاور مدیر عامل و مجری طرح های روستائی ', N'1396-1397')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (106, 9, N' مدیر امور کارکنان و رفاه', N'1397-1398')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (107, 9, N'تا کنون مدیر دفترآموزش و برنامه ریزی نیروی انسانی ', N'1398-تاکنون')
GO
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (108, 10, N'شرکت توزیع  نیروی برق جنوبشرق', N'1378-1386')
INSERT [dbo].[AboutUs_Records] ([Id], [AssistantId], [Name], [Years]) VALUES (109, 10, N'شرکت توزیع نیروی برق استان تهران', N'1389-تاکنون')
SET IDENTITY_INSERT [dbo].[AboutUs_Records] OFF
ALTER TABLE [dbo].[AboutUs_Contacts]  WITH CHECK ADD  CONSTRAINT [FK_AboutUs_Contacts_AboutUs_ContactTypes] FOREIGN KEY([ContactTypeId])
REFERENCES [dbo].[AboutUs_ContactTypes] ([Id])
GO
ALTER TABLE [dbo].[AboutUs_Contacts] CHECK CONSTRAINT [FK_AboutUs_Contacts_AboutUs_ContactTypes]
GO
ALTER TABLE [dbo].[AboutUs_Contacts]  WITH CHECK ADD  CONSTRAINT [FK_AboutUs_Contacts_AboutUs_OfficeContacts] FOREIGN KEY([AssistantId])
REFERENCES [dbo].[AboutUs_OfficeContacts] ([Id])
GO
ALTER TABLE [dbo].[AboutUs_Contacts] CHECK CONSTRAINT [FK_AboutUs_Contacts_AboutUs_OfficeContacts]
GO
ALTER TABLE [dbo].[AboutUs_OfficeContacts]  WITH CHECK ADD  CONSTRAINT [FK_AboutUs_OfficeContacts_AboutUs_OfficeContacts] FOREIGN KEY([AssistantId])
REFERENCES [dbo].[AboutUs_OfficeContacts] ([Id])
GO
ALTER TABLE [dbo].[AboutUs_OfficeContacts] CHECK CONSTRAINT [FK_AboutUs_OfficeContacts_AboutUs_OfficeContacts]
GO
ALTER TABLE [dbo].[AboutUs_OfficeExperts]  WITH CHECK ADD  CONSTRAINT [FK_AboutUs_OfficeExperts_AboutUs_OfficeContacts] FOREIGN KEY([AssistantId])
REFERENCES [dbo].[AboutUs_OfficeContacts] ([Id])
GO
ALTER TABLE [dbo].[AboutUs_OfficeExperts] CHECK CONSTRAINT [FK_AboutUs_OfficeExperts_AboutUs_OfficeContacts]
GO
ALTER TABLE [dbo].[AboutUs_Records]  WITH CHECK ADD  CONSTRAINT [FK_AboutUs_Records_AboutUs_OfficeContacts] FOREIGN KEY([AssistantId])
REFERENCES [dbo].[AboutUs_OfficeContacts] ([Id])
GO
ALTER TABLE [dbo].[AboutUs_Records] CHECK CONSTRAINT [FK_AboutUs_Records_AboutUs_OfficeContacts]
GO
USE [master]
GO
ALTER DATABASE [AboutUsDB] SET  READ_WRITE 
GO
