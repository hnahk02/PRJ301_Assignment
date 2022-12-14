USE [master]
GO
/****** Object:  Database [PRJ301_Assignment]    Script Date: 11/8/2022 10:00:33 PM ******/
CREATE DATABASE [PRJ301_Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301_Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ301_Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PRJ301_Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ301_Assignment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [PRJ301_Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ301_Assignment', N'ON'
GO
ALTER DATABASE [PRJ301_Assignment] SET QUERY_STORE = OFF
GO
USE [PRJ301_Assignment]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
	[classify_account] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Lecturer]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Lecturer](
	[username] [varchar](150) NOT NULL,
	[lid] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Student]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Student](
	[username] [varchar](150) NOT NULL,
	[stdid] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attandance]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attandance](
	[sesid] [int] NOT NULL,
	[stdid] [int] NOT NULL,
	[present] [bit] NOT NULL,
	[description] [varchar](150) NULL,
	[record_time] [varchar](150) NULL,
 CONSTRAINT [PK_Attandance] PRIMARY KEY CLUSTERED 
(
	[sesid] ASC,
	[stdid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fe_id] [int] NOT NULL,
	[fename] [varchar](150) NOT NULL,
	[url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
	[subid] [int] NOT NULL,
	[lid] [int] NOT NULL,
	[semester] [varchar](150) NOT NULL,
	[year] [int] NOT NULL,
	[term_id] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[lid] [int] NOT NULL,
	[lname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] NOT NULL,
	[role_name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Account]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Account](
	[role_id] [int] NOT NULL,
	[username] [varchar](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[role_id] [int] NOT NULL,
	[fe_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[sesid] [int] NOT NULL,
	[gid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[tid] [int] NOT NULL,
	[index] [int] NOT NULL,
	[lid] [int] NOT NULL,
	[attanded] [bit] NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[sesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[stdid] [int] NOT NULL,
	[stdname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[stdid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Group]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Group](
	[stdid] [int] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Student_Group] PRIMARY KEY CLUSTERED 
(
	[stdid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subid] [int] NOT NULL,
	[subname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Term]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Term](
	[term_id] [int] NOT NULL,
	[tname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Term] PRIMARY KEY CLUSTERED 
(
	[term_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 11/8/2022 10:00:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[tid] [int] NOT NULL,
	[time_range] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'bantq', N'123', N'bantq', N'lecturer')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'caupd', N'123', N'caupd', N'lecturer')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'sonnt', N'123', N'sonnt', N'lecturer')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'std1', N'123', N'std1', N'student')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'std10', N'123', N'std10', N'student')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'std11', N'123', N'std11', N'student')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'std12', N'123', N'std12', N'student')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'std2', N'123', N'std1', N'student')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'std20', N'123', N'std20', N'student')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'std3', N'123', N'std1', N'student')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'std30', N'123', N'std30', N'student')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'std4', N'123', N'std1', N'student')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'std5', N'123', N'std1', N'student')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'std6', N'123', N'std6', N'student')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'std7', N'123', N'std7', N'student')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'std8', N'123', N'std8', N'student')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'std9', N'123', N'std9', N'student')
INSERT [dbo].[Account] ([username], [password], [displayname], [classify_account]) VALUES (N'tuanvm', N'123', N'tuanvm', N'lecturer')
GO
INSERT [dbo].[Account_Lecturer] ([username], [lid]) VALUES (N'sonnt', 1)
INSERT [dbo].[Account_Lecturer] ([username], [lid]) VALUES (N'bantq', 2)
INSERT [dbo].[Account_Lecturer] ([username], [lid]) VALUES (N'tuanvm', 3)
INSERT [dbo].[Account_Lecturer] ([username], [lid]) VALUES (N'caupd', 4)
GO
INSERT [dbo].[Account_Student] ([username], [stdid]) VALUES (N'std1', 1)
INSERT [dbo].[Account_Student] ([username], [stdid]) VALUES (N'std2', 2)
INSERT [dbo].[Account_Student] ([username], [stdid]) VALUES (N'std3', 3)
INSERT [dbo].[Account_Student] ([username], [stdid]) VALUES (N'std4', 4)
INSERT [dbo].[Account_Student] ([username], [stdid]) VALUES (N'std5', 5)
INSERT [dbo].[Account_Student] ([username], [stdid]) VALUES (N'std20', 20)
INSERT [dbo].[Account_Student] ([username], [stdid]) VALUES (N'std30', 30)
INSERT [dbo].[Account_Student] ([username], [stdid]) VALUES (N'std10', 10)
INSERT [dbo].[Account_Student] ([username], [stdid]) VALUES (N'std6', 6)
INSERT [dbo].[Account_Student] ([username], [stdid]) VALUES (N'std7', 7)
INSERT [dbo].[Account_Student] ([username], [stdid]) VALUES (N'std8', 8)
INSERT [dbo].[Account_Student] ([username], [stdid]) VALUES (N'std9', 9)
INSERT [dbo].[Account_Student] ([username], [stdid]) VALUES (N'std11', 11)
INSERT [dbo].[Account_Student] ([username], [stdid]) VALUES (N'std12', 12)
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 1, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 2, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 3, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 4, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 5, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 11, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 12, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 13, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 14, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 15, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 1, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 2, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 3, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 4, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 5, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 11, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 12, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 13, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 14, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, 15, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 1, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 2, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 3, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 4, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 5, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 11, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 12, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 13, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 14, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 15, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 1, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 2, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 3, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 4, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 5, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 11, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 12, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 13, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 14, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 15, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 1, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 2, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 3, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 4, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 5, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 11, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 12, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 13, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 14, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (5, 15, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 1, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 2, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 3, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 4, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 5, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 11, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 12, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 13, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 14, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 15, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, 1, 1, N'good', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, 2, 0, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, 3, 1, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, 4, 0, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, 5, 1, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, 11, 0, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, 12, 0, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, 13, 0, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, 14, 1, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, 15, 0, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (8, 1, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (8, 2, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (8, 3, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (8, 4, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (8, 5, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (8, 11, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (8, 12, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (8, 13, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (8, 14, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (8, 15, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (9, 1, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (9, 2, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (9, 3, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (9, 4, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (9, 5, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (9, 11, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (9, 12, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (9, 13, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (9, 14, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (9, 15, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (10, 1, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (10, 2, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (10, 3, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (10, 4, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (10, 5, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (10, 11, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (10, 12, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (10, 13, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (10, 14, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (10, 15, 0, NULL, NULL)
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (11, 1, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (11, 2, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (11, 3, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (11, 4, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (11, 5, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (11, 11, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (11, 12, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (11, 13, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (11, 14, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (11, 15, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (12, 1, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (12, 2, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (12, 3, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (12, 4, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (12, 5, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (12, 11, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (12, 12, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (12, 13, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (12, 14, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (12, 15, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (13, 1, 1, N'good', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (13, 2, 0, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (13, 3, 1, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (13, 4, 0, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (13, 5, 0, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (13, 11, 0, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (13, 12, 0, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (13, 13, 1, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (13, 14, 1, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (13, 15, 0, N'', N'Nov  8 2022  9:36PM')
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (14, 1, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (14, 2, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (14, 3, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (14, 4, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (14, 5, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (14, 11, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (14, 12, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (14, 13, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (14, 14, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (14, 15, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (15, 1, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (15, 2, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (15, 3, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (15, 4, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (15, 5, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (15, 11, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (15, 12, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (15, 13, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (15, 14, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (15, 15, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (16, 1, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (16, 2, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (16, 3, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (16, 4, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (16, 5, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (16, 11, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (16, 12, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (16, 13, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (16, 14, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (16, 15, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (17, 1, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (17, 2, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (17, 3, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (17, 4, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (17, 5, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (17, 11, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (17, 12, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (17, 13, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (17, 14, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (17, 15, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (18, 1, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (18, 2, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (18, 3, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (18, 4, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (18, 5, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (18, 11, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (18, 12, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (18, 13, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (18, 14, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (18, 15, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (19, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (19, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (19, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (19, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (19, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (19, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (19, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (19, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (19, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (19, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (20, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (20, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (20, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (20, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (20, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (20, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (20, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (20, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (20, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (20, 25, 0, NULL, NULL)
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (21, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (21, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (21, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (21, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (21, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (21, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (21, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (21, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (21, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (21, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (22, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (22, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (22, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (22, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (22, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (22, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (22, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (22, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (22, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (22, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (23, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (23, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (23, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (23, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (23, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (23, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (23, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (23, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (23, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (23, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (24, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (24, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (24, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (24, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (24, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (24, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (24, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (24, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (24, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (24, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (25, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (25, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (25, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (25, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (25, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (25, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (25, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (25, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (25, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (25, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (26, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (26, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (26, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (26, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (26, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (26, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (26, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (26, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (26, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (26, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (27, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (27, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (27, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (27, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (27, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (27, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (27, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (27, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (27, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (27, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (28, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (28, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (28, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (28, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (28, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (28, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (28, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (28, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (28, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (28, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (29, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (29, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (29, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (29, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (29, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (29, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (29, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (29, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (29, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (29, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (30, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (30, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (30, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (30, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (30, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (30, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (30, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (30, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (30, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (30, 25, 0, NULL, NULL)
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (31, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (31, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (31, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (31, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (31, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (31, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (31, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (31, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (31, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (31, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (32, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (32, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (32, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (32, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (32, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (32, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (32, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (32, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (32, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (32, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (33, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (33, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (33, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (33, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (33, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (33, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (33, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (33, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (33, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (33, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (34, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (34, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (34, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (34, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (34, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (34, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (34, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (34, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (34, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (34, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (35, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (35, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (35, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (35, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (35, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (35, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (35, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (35, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (35, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (35, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (36, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (36, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (36, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (36, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (36, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (36, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (36, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (36, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (36, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (36, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (37, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (37, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (37, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (37, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (37, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (37, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (37, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (37, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (37, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (37, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (38, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (38, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (38, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (38, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (38, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (38, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (38, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (38, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (38, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (38, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (39, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (39, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (39, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (39, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (39, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (39, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (39, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (39, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (39, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (39, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (40, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (40, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (40, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (40, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (40, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (40, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (40, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (40, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (40, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (40, 25, 0, NULL, NULL)
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (41, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (41, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (41, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (41, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (41, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (41, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (41, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (41, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (41, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (41, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (42, 6, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (42, 7, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (42, 8, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (42, 9, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (42, 10, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (42, 21, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (42, 22, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (42, 23, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (42, 24, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (42, 25, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (43, 16, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (43, 17, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (43, 18, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (43, 19, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (43, 20, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (43, 26, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (43, 27, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (43, 28, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (43, 29, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (43, 30, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (44, 16, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (44, 17, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (44, 18, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (44, 19, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (44, 20, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (44, 26, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (44, 27, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (44, 28, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (44, 29, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (44, 30, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (45, 16, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (45, 17, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (45, 18, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (45, 19, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (45, 20, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (45, 26, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (45, 27, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (45, 28, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (45, 29, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (45, 30, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (46, 16, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (46, 17, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (46, 18, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (46, 19, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (46, 20, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (46, 26, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (46, 27, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (46, 28, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (46, 29, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (46, 30, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (47, 16, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (47, 17, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (47, 18, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (47, 19, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (47, 20, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (47, 26, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (47, 27, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (47, 28, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (47, 29, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (47, 30, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (48, 16, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (48, 17, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (48, 18, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (48, 19, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (48, 20, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (48, 26, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (48, 27, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (48, 28, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (48, 29, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (48, 30, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (49, 16, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (49, 17, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (49, 18, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (49, 19, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (49, 20, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (49, 26, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (49, 27, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (49, 28, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (49, 29, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (49, 30, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (50, 16, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (50, 17, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (50, 18, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (50, 19, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (50, 20, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (50, 26, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (50, 27, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (50, 28, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (50, 29, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (50, 30, 0, NULL, NULL)
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (51, 16, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (51, 17, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (51, 18, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (51, 19, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (51, 20, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (51, 26, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (51, 27, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (51, 28, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (51, 29, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (51, 30, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (52, 16, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (52, 17, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (52, 18, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (52, 19, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (52, 20, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (52, 26, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (52, 27, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (52, 28, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (52, 29, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (52, 30, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (53, 16, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (53, 17, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (53, 18, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (53, 19, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (53, 20, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (53, 26, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (53, 27, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (53, 28, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (53, 29, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (53, 30, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (54, 16, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (54, 17, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (54, 18, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (54, 19, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (54, 20, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (54, 26, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (54, 27, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (54, 28, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (54, 29, 0, NULL, NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (54, 30, 0, NULL, NULL)
GO
INSERT [dbo].[Feature] ([fe_id], [fename], [url]) VALUES (1, N'view lecturer timtable', N'/lecturer/lecturertimetable')
INSERT [dbo].[Feature] ([fe_id], [fename], [url]) VALUES (2, N'view group', N'/lecturer/viewgroup')
INSERT [dbo].[Feature] ([fe_id], [fename], [url]) VALUES (3, N'view attend report of group', N'/lecturer/viewattendreport')
INSERT [dbo].[Feature] ([fe_id], [fename], [url]) VALUES (4, N'view list session of group', N'/lecturer/viewListSessionGroup')
INSERT [dbo].[Feature] ([fe_id], [fename], [url]) VALUES (5, N'take attandance', N'/lecturer/takeattend')
INSERT [dbo].[Feature] ([fe_id], [fename], [url]) VALUES (6, N'view student weekly timtable', N'/student/weeklytimtable')
INSERT [dbo].[Feature] ([fe_id], [fename], [url]) VALUES (7, N'view student attend report', N'/report/viewAttendStudent')
GO
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [semester], [year], [term_id]) VALUES (1, N'SWE201c_SE1643', 1, 1, N'FALL ', 2022, 1)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [semester], [year], [term_id]) VALUES (2, N'NWC203c_SE1644', 2, 1, N'FALL', 2022, 1)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [semester], [year], [term_id]) VALUES (3, N'PRJ301_SE1645', 6, 1, N'FALL', 2022, 1)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [semester], [year], [term_id]) VALUES (4, N'PRJ301_SE1643', 6, 1, N'FALL', 2022, 1)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [semester], [year], [term_id]) VALUES (5, N'WED201c_SE1645', 4, 2, N'FALL', 2022, 1)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [semester], [year], [term_id]) VALUES (6, N'SSL101c_SE1646', 3, 2, N'FALL', 2022, 1)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [semester], [year], [term_id]) VALUES (7, N'IOT102_SE1647', 5, 2, N'FALL', 2022, 1)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [semester], [year], [term_id]) VALUES (8, N'IOT102_SE1645', 5, 3, N'FALL', 2022, 1)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [semester], [year], [term_id]) VALUES (9, N'SWE201c_SE1643', 1, 3, N'FALL ', 2022, 1)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [semester], [year], [term_id]) VALUES (10, N'WED201c_SE1646', 4, 3, N'FALL', 2022, 1)
GO
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (1, N'Ngo Tung Son')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (2, N'Tran Quy Ban')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (3, N'Vuong Minh Tuan')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (4, N'Cau PD')
GO
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'lecturer')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'student')
GO
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (1, N'sonnt')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (1, N'bantq')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (1, N'tuanvm')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (1, N'caupd')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (2, N'std1')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (2, N'std2')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (2, N'std3')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (2, N'std4')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (2, N'std5')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (2, N'std20')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (2, N'std30')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (2, N'std6')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (2, N'std10')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (2, N'std7')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (2, N'std8')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (2, N'std9')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (2, N'std11')
INSERT [dbo].[Role_Account] ([role_id], [username]) VALUES (2, N'std12')
GO
INSERT [dbo].[Role_Feature] ([role_id], [fe_id]) VALUES (1, 1)
INSERT [dbo].[Role_Feature] ([role_id], [fe_id]) VALUES (1, 2)
INSERT [dbo].[Role_Feature] ([role_id], [fe_id]) VALUES (1, 3)
INSERT [dbo].[Role_Feature] ([role_id], [fe_id]) VALUES (1, 4)
INSERT [dbo].[Role_Feature] ([role_id], [fe_id]) VALUES (1, 5)
INSERT [dbo].[Role_Feature] ([role_id], [fe_id]) VALUES (2, 6)
INSERT [dbo].[Role_Feature] ([role_id], [fe_id]) VALUES (2, 7)
GO
INSERT [dbo].[Room] ([rid], [rname]) VALUES (1, N'ABC_123')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (2, N'ABC_456')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (3, N'ABC_789')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (4, N'DEF_123')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (5, N'DEF_456')
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (1, 1, 1, CAST(N'2022-11-07' AS Date), 2, 1, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (2, 1, 1, CAST(N'2022-11-09' AS Date), 1, 2, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (3, 1, 1, CAST(N'2022-11-11' AS Date), 3, 3, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (4, 1, 1, CAST(N'2022-11-14' AS Date), 2, 4, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (5, 1, 1, CAST(N'2022-11-16' AS Date), 1, 5, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (6, 1, 1, CAST(N'2022-11-18' AS Date), 3, 6, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (7, 2, 2, CAST(N'2022-11-08' AS Date), 1, 1, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (8, 2, 2, CAST(N'2022-11-09' AS Date), 2, 2, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (9, 2, 2, CAST(N'2022-11-11' AS Date), 1, 3, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (10, 2, 2, CAST(N'2022-11-13' AS Date), 5, 4, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (11, 2, 2, CAST(N'2022-11-16' AS Date), 2, 5, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (12, 2, 2, CAST(N'2022-11-18' AS Date), 2, 6, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (13, 3, 3, CAST(N'2022-11-08' AS Date), 5, 1, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (14, 3, 3, CAST(N'2022-11-09' AS Date), 6, 2, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (15, 3, 3, CAST(N'2022-11-11' AS Date), 6, 3, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (16, 3, 3, CAST(N'2022-11-14' AS Date), 6, 4, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (17, 3, 3, CAST(N'2022-11-16' AS Date), 6, 5, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (18, 3, 3, CAST(N'2022-11-18' AS Date), 6, 6, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (19, 4, 1, CAST(N'2022-11-09' AS Date), 4, 1, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (20, 4, 1, CAST(N'2022-11-12' AS Date), 4, 2, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (21, 4, 1, CAST(N'2022-11-21' AS Date), 4, 3, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (22, 4, 1, CAST(N'2022-11-22' AS Date), 4, 4, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (23, 4, 1, CAST(N'2022-11-24' AS Date), 4, 5, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (24, 4, 1, CAST(N'2022-11-26' AS Date), 4, 6, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (25, 5, 4, CAST(N'2022-11-09' AS Date), 1, 1, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (26, 5, 4, CAST(N'2022-11-11' AS Date), 2, 2, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (27, 5, 4, CAST(N'2022-11-12' AS Date), 3, 3, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (28, 5, 4, CAST(N'2022-11-18' AS Date), 4, 4, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (29, 5, 4, CAST(N'2022-11-19' AS Date), 5, 5, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (30, 5, 4, CAST(N'2022-11-20' AS Date), 6, 6, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (31, 6, 5, CAST(N'2022-11-09' AS Date), 6, 1, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (32, 6, 5, CAST(N'2022-11-12' AS Date), 5, 2, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (33, 6, 5, CAST(N'2022-11-14' AS Date), 4, 3, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (34, 6, 5, CAST(N'2022-11-16' AS Date), 3, 4, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (35, 6, 5, CAST(N'2022-11-18' AS Date), 2, 5, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (36, 6, 5, CAST(N'2022-11-20' AS Date), 1, 6, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (37, 7, 3, CAST(N'2022-11-09' AS Date), 3, 1, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (38, 7, 3, CAST(N'2022-11-12' AS Date), 1, 2, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (39, 7, 3, CAST(N'2022-11-14' AS Date), 3, 3, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (40, 7, 3, CAST(N'2022-11-18' AS Date), 2, 4, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (41, 7, 3, CAST(N'2022-11-20' AS Date), 5, 5, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (42, 7, 3, CAST(N'2022-12-09' AS Date), 6, 6, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (43, 9, 2, CAST(N'2022-11-11' AS Date), 3, 1, 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (44, 9, 2, CAST(N'2022-11-13' AS Date), 2, 2, 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (45, 9, 2, CAST(N'2022-11-16' AS Date), 1, 3, 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (46, 9, 2, CAST(N'2022-11-19' AS Date), 2, 4, 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (47, 9, 2, CAST(N'2022-11-20' AS Date), 2, 5, 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (48, 9, 2, CAST(N'2022-11-22' AS Date), 2, 6, 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (49, 10, 3, CAST(N'2022-11-09' AS Date), 2, 1, 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (50, 10, 3, CAST(N'2022-11-11' AS Date), 4, 2, 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (51, 10, 3, CAST(N'2022-11-13' AS Date), 5, 3, 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (52, 10, 3, CAST(N'2022-11-15' AS Date), 6, 4, 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (53, 10, 3, CAST(N'2022-11-17' AS Date), 3, 5, 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (54, 10, 3, CAST(N'2022-11-18' AS Date), 2, 6, 3, 0)
GO
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (1, N'Std1')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (2, N'Std2')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (3, N'Std3')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (4, N'Std4')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (5, N'Std5')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (6, N'Std6')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (7, N'Std7')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (8, N'Std8')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (9, N'Std9')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (10, N'Std10')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (11, N'Std11')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (12, N'Std12')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (13, N'Std13')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (14, N'Std14')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (15, N'Std15')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (16, N'Std16')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (17, N'Std17')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (18, N'Std18')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (19, N'Std19')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (20, N'Std20')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (21, N'Std21')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (22, N'Std22')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (23, N'Std23')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (24, N'Std24')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (25, N'Std25')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (26, N'Std26')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (27, N'Std27')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (28, N'Std28')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (29, N'Std29')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (30, N'Std30')
GO
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (1, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (1, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (1, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (2, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (2, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (2, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (3, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (3, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (3, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (4, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (4, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (4, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (5, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (5, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (5, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (6, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (6, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (6, 6)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 6)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (8, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (8, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (8, 6)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (9, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (9, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (9, 6)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (10, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (10, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (10, 6)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (11, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (11, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (11, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (12, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (12, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (12, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (13, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (13, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (13, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (14, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (14, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (14, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (15, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (15, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (15, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (16, 7)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (16, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (16, 10)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (17, 7)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (17, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (17, 10)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (18, 7)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (18, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (18, 10)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (19, 7)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (19, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (19, 10)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (20, 7)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (20, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (20, 10)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (21, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (21, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (21, 6)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (22, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (22, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (22, 6)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (23, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (23, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (23, 6)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (24, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (24, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (24, 6)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (25, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (25, 5)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (25, 6)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (26, 7)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (26, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (26, 10)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (27, 7)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (27, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (27, 10)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (28, 7)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (28, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (28, 10)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (29, 7)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (29, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (29, 10)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (30, 7)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (30, 9)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (30, 10)
GO
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (1, N'SWE201c')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (2, N'NWC203c')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (3, N'SSL101c')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (4, N'WED201c')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (5, N'IOT102')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (6, N'PRJ301')
GO
INSERT [dbo].[Term] ([term_id], [tname]) VALUES (1, N'FALL 2022')
GO
INSERT [dbo].[TimeSlot] ([tid], [time_range]) VALUES (1, N'Slot 1_(7:30-9:00)')
INSERT [dbo].[TimeSlot] ([tid], [time_range]) VALUES (2, N'Slot 2_(9:10-10:40)')
INSERT [dbo].[TimeSlot] ([tid], [time_range]) VALUES (3, N'Slot 3_(10:50-12:20)')
INSERT [dbo].[TimeSlot] ([tid], [time_range]) VALUES (4, N'Slot 4_(12:50-2:20)')
INSERT [dbo].[TimeSlot] ([tid], [time_range]) VALUES (5, N'Slot 5_(2:30-4:00)')
INSERT [dbo].[TimeSlot] ([tid], [time_range]) VALUES (6, N'Slot 6_(4:10-5:40)')
GO
ALTER TABLE [dbo].[Account_Lecturer]  WITH CHECK ADD  CONSTRAINT [FK_Account_Lecturer_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Account_Lecturer] CHECK CONSTRAINT [FK_Account_Lecturer_Account]
GO
ALTER TABLE [dbo].[Account_Lecturer]  WITH CHECK ADD  CONSTRAINT [FK_Account_Lecturer_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Account_Lecturer] CHECK CONSTRAINT [FK_Account_Lecturer_Lecturer]
GO
ALTER TABLE [dbo].[Account_Student]  WITH CHECK ADD  CONSTRAINT [FK_Account_Student_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Account_Student] CHECK CONSTRAINT [FK_Account_Student_Account]
GO
ALTER TABLE [dbo].[Account_Student]  WITH CHECK ADD  CONSTRAINT [FK_Account_Student_Student] FOREIGN KEY([stdid])
REFERENCES [dbo].[Student] ([stdid])
GO
ALTER TABLE [dbo].[Account_Student] CHECK CONSTRAINT [FK_Account_Student_Student]
GO
ALTER TABLE [dbo].[Attandance]  WITH CHECK ADD  CONSTRAINT [FK_Attandance_Session1] FOREIGN KEY([sesid])
REFERENCES [dbo].[Session] ([sesid])
GO
ALTER TABLE [dbo].[Attandance] CHECK CONSTRAINT [FK_Attandance_Session1]
GO
ALTER TABLE [dbo].[Attandance]  WITH CHECK ADD  CONSTRAINT [FK_Attandance_Student] FOREIGN KEY([stdid])
REFERENCES [dbo].[Student] ([stdid])
GO
ALTER TABLE [dbo].[Attandance] CHECK CONSTRAINT [FK_Attandance_Student]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([subid])
REFERENCES [dbo].[Subject] ([subid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Term] FOREIGN KEY([term_id])
REFERENCES [dbo].[Term] ([term_id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Term]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Account]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Role]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Feature] FOREIGN KEY([fe_id])
REFERENCES [dbo].[Feature] ([fe_id])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Feature]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Role]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Group]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Lecturer]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Room] FOREIGN KEY([rid])
REFERENCES [dbo].[Room] ([rid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Room]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_TimeSlot] FOREIGN KEY([tid])
REFERENCES [dbo].[TimeSlot] ([tid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_TimeSlot]
GO
ALTER TABLE [dbo].[Student_Group]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Student_Group] CHECK CONSTRAINT [FK_Student_Group_Group]
GO
ALTER TABLE [dbo].[Student_Group]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group_Student] FOREIGN KEY([stdid])
REFERENCES [dbo].[Student] ([stdid])
GO
ALTER TABLE [dbo].[Student_Group] CHECK CONSTRAINT [FK_Student_Group_Student]
GO
USE [master]
GO
ALTER DATABASE [PRJ301_Assignment] SET  READ_WRITE 
GO
