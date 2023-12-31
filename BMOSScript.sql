USE [master]
GO
/****** Object:  Database [BMOS_v4]    Script Date: 7/10/2023 11:53:48 PM ******/
CREATE DATABASE [BMOS_v4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BMOS_v4', FILENAME = N'E:\MCS_SQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\BMOS_v4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BMOS_v4_log', FILENAME = N'E:\MCS_SQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\BMOS_v4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BMOS_v4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BMOS_v4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BMOS_v4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BMOS_v4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BMOS_v4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BMOS_v4] SET ARITHABORT OFF 
GO
ALTER DATABASE [BMOS_v4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BMOS_v4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BMOS_v4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BMOS_v4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BMOS_v4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BMOS_v4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BMOS_v4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BMOS_v4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BMOS_v4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BMOS_v4] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BMOS_v4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BMOS_v4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BMOS_v4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BMOS_v4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BMOS_v4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BMOS_v4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BMOS_v4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BMOS_v4] SET RECOVERY FULL 
GO
ALTER DATABASE [BMOS_v4] SET  MULTI_USER 
GO
ALTER DATABASE [BMOS_v4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BMOS_v4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BMOS_v4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BMOS_v4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BMOS_v4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BMOS_v4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BMOS_v4', N'ON'
GO
ALTER DATABASE [BMOS_v4] SET QUERY_STORE = ON
GO
ALTER DATABASE [BMOS_v4] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BMOS_v4]
GO
/****** Object:  Table [dbo].[tbl_Bird]    Script Date: 7/10/2023 11:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Bird](
	[bird_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[bird_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Blog]    Script Date: 7/10/2023 11:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Blog](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[thumbnail] [nvarchar](max) NULL,
	[title] [nvarchar](100) NULL,
	[date_update] [date] NULL,
	[content] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[status] [bit] NULL,
	[hashtag] [nvarchar](100) NULL,
	[bird_id] [int] NULL,
 CONSTRAINT [PK__tbl_Blog__2975AA2840840A0A] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Category]    Script Date: 7/10/2023 11:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[status] [bit] NULL,
	[img] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Feedback]    Script Date: 7/10/2023 11:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[note] [nvarchar](max) NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_LifeCycle]    Script Date: 7/10/2023 11:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_LifeCycle](
	[lifecycle_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[lifecycle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Meal]    Script Date: 7/10/2023 11:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Meal](
	[quantity] [int] NULL,
	[meal_package_id] [int] NULL,
	[product_id] [int] NULL,
	[description] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MealPackage]    Script Date: 7/10/2023 11:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MealPackage](
	[meal_package_id] [int] IDENTITY(1,1) NOT NULL,
	[meal_code] [nvarchar](6) NULL,
	[title_mealpackage] [nvarchar](350) NULL,
	[quantity] [int] NULL,
	[price] [int] NULL,
	[discount_price] [int] NULL,
	[thumbnail] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[recipe] [nvarchar](max) NULL,
	[create_at] [date] NULL,
	[update_at] [date] NULL,
	[status] [bit] NULL,
	[bird_id] [int] NULL,
	[lifecycle_id] [int] NULL,
	[img] [nvarchar](max) NULL,
 CONSTRAINT [PK__tbl_Meal__D4B0B2EE41384D97] PRIMARY KEY CLUSTERED 
(
	[meal_package_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MealPlan]    Script Date: 7/10/2023 11:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MealPlan](
	[meal_package_id] [int] NULL,
	[breakfast] [nvarchar](max) NULL,
	[lunch] [nvarchar](max) NULL,
	[dinner] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Order]    Script Date: 7/10/2023 11:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_code] [nvarchar](10) NULL,
	[order_date] [date] NULL,
	[note] [nvarchar](max) NULL,
	[totalMoney] [int] NULL,
	[status] [bit] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_OrderDetail]    Script Date: 7/10/2023 11:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OrderDetail](
	[orderDetail_id] [int] IDENTITY(1,1) NOT NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
	[product_id] [int] NULL,
	[oder_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 7/10/2023 11:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_code] [nvarchar](6) NULL,
	[title] [nvarchar](350) NULL,
	[quantity] [int] NULL,
	[price] [int] NULL,
	[discount_price] [int] NULL,
	[weight] [float] NULL,
	[thumbnail] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[create_at] [date] NULL,
	[update_at] [date] NULL,
	[status] [bit] NULL,
	[category_id] [int] NULL,
	[feedback_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Role]    Script Date: 7/10/2023 11:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 7/10/2023 11:53:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](20) NULL,
	[email] [nvarchar](100) NULL,
	[phone_number] [nvarchar](20) NULL,
	[address] [nvarchar](200) NULL,
	[status] [bit] NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Bird] ON 

INSERT [dbo].[tbl_Bird] ([bird_id], [name]) VALUES (1, N'Sparrow')
INSERT [dbo].[tbl_Bird] ([bird_id], [name]) VALUES (2, N'Eagle')
INSERT [dbo].[tbl_Bird] ([bird_id], [name]) VALUES (3, N'Hwamei')
INSERT [dbo].[tbl_Bird] ([bird_id], [name]) VALUES (4, N'Falcon')
SET IDENTITY_INSERT [dbo].[tbl_Bird] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Blog] ON 

INSERT [dbo].[tbl_Blog] ([blog_id], [thumbnail], [title], [date_update], [content], [description], [status], [hashtag], [bird_id]) VALUES (1, N'1_1.png', N'Sparrow care guide', NULL, N'To take care of a sparrow, we need', N'The Eurasian Tree Sparrow, commonly known as the house sparrow or simply the sparrow, is a small passerine bird species that belongs to the sparrow family, Passeridae. Here''s a description of the sparrow in English:

The sparrow is a small bird, typically measuring around 14 to 16 centimeters in length. It has a plump body with a short, stout beak. The male and female sparrows have similar appearances, with brown feathers on their backs and wings, and lighter underparts. The male sparrow features a distinctive black patch on its throat and chest, known as a bib. The bib is absent in females and young sparrows.

Sparrows are highly adaptable and are found in various habitats, including urban areas, farmlands, woodlands, and grasslands. They are native to Europe and Asia but have been introduced to many other parts of the world, including North America, where they have established thriving populations.

These social birds are known for their lively and energetic behavior. They form large flocks and often gather in communal roosts during the non-breeding season. Sparrows have a diverse diet that primarily consists of seeds, grains, and small insects. They forage on the ground or in low vegetation, using their beaks to crack open seeds or catch insects in flight.

Sparrows are monogamous birds and typically form long-term pair bonds. They build nests in cavities, such as tree holes, building crevices, or birdhouses. The nests are constructed using grass, twigs, and other plant materials, and lined with softer materials like feathers or moss. Female sparrows lay multiple eggs, which are incubated by both parents. The hatchlings are fed by regurgitation until they are old enough to fledge.

Sparrows are known for their melodious songs, which consist of chirps, trills, and chattering sounds. Their vocalizations are used for communication within the flock, courtship displays, and territory defense.

Due to their adaptability and close association with human habitats, sparrows are often considered familiar and charismatic birds. They are appreciated for their role in controlling insect populations and adding a touch of liveliness to urban environments.

Please note that the specific characteristics and behaviors of sparrows can vary slightly depending on the region and species being referred to.', 1, N'Sparrow', 1)
INSERT [dbo].[tbl_Blog] ([blog_id], [thumbnail], [title], [date_update], [content], [description], [status], [hashtag], [bird_id]) VALUES (2, N'2_1.png', N'Hwamei care guide', NULL, N'To take care of a hwamei, we need', N'The Hwamei, also known as the Chinese Hwamei or Melodious Laughingthrush, is a small bird species known for its beautiful song and vibrant appearance. Here''s a description of the Hwamei bird in English:

The Hwamei is a medium-sized bird, typically measuring around 20 centimeters in length. It has a stout body with a relatively short tail and a slightly curved beak. The plumage of the Hwamei is striking, with a combination of black, brown, and golden-yellow feathers. It has a distinctive pattern on its head, with a black mask around the eyes and a bright yellow crown.

Hwamei birds are native to East Asia, including China, Vietnam, and Malaysia. They are highly sought after for their melodious and complex songs, which consist of a wide range of whistles, trills, and varied notes. Their songs are often compared to the sound of laughter, hence their nickname, "Laughingthrush." Male Hwamei birds are particularly known for their impressive vocal performances during the breeding season.

These birds are primarily found in forests, woodlands, and shrublands, but they have also adapted to urban areas with suitable vegetation. Hwamei birds are known for their secretive nature, preferring to stay hidden within dense foliage. They are excellent climbers and have strong legs and feet, enabling them to navigate through trees and shrubs with ease.

Hwamei birds primarily feed on insects, spiders, and other small invertebrates, which they forage for among leaves and branches. They also consume a variety of fruits and seeds, supplementing their diet with plant matter.

During the breeding season, male Hwamei birds engage in elaborate courtship displays to attract females. They sing from elevated perches and may engage in fluttering flights to showcase their colorful plumage. The female builds a cup-shaped nest using twigs, grass, and other plant materials, often placed in dense vegetation or bushes. She lays a clutch of eggs, and both parents take turns incubating them.

The Hwamei bird is valued for its melodious song and is highly regarded in some cultures for its symbolic and aesthetic qualities. However, due to trapping for the pet trade and habitat loss, Hwamei populations have declined in some regions. Conservation efforts are underway to protect this charismatic bird species.

Please note that the Hwamei bird is also known by different names in various regions and languages.', 1, N'Hwamei', 2)
INSERT [dbo].[tbl_Blog] ([blog_id], [thumbnail], [title], [date_update], [content], [description], [status], [hashtag], [bird_id]) VALUES (3, N'3_1.png', N'Eagle care guide', NULL, N'To take care of an eagle, we need', N'The Bald Eagle, also known simply as the eagle or Haliaeetus leucocephalus, is a majestic bird of prey known for its iconic appearance and powerful flying ability. Here''s a description of the Bald Eagle in English:

The Bald Eagle is a large bird, typically measuring between 70 and 100 centimeters in length, with a wingspan ranging from 1.8 to 2.3 meters. It has a distinctive appearance with a white head and tail contrasting against a dark brown body. Adult Bald Eagles have a hooked yellow beak and sharp, taloned feet perfectly adapted for hunting.

Bald Eagles are primarily found in North America, with a significant population in Alaska and Canada. They prefer habitats near bodies of water such as rivers, lakes, and coastlines, as they primarily feed on fish. These eagles are known for their impressive diving and fishing skills, swooping down from the sky to snatch fish from the water''s surface.

Apart from fish, Bald Eagles also consume a variety of other prey, including waterfowl, small mammals, and carrion. They are opportunistic hunters and scavengers, and their diet may vary depending on food availability in their habitat.

Bald Eagles are known for their incredible strength and agility in flight. They can reach speeds of up to 55 kilometers per hour (34 miles per hour) during level flight and even faster when diving. Their broad wings and powerful muscles allow them to soar effortlessly, riding thermal updrafts and using their keen eyesight to spot prey from great distances.

These eagles are also known for their impressive nesting behavior. They build large nests called "aeries" typically situated in tall trees near water bodies. The nests are constructed with sticks and lined with softer materials such as grass, moss, or feathers. Bald Eagles mate for life, and pairs will often return to the same nest year after year, adding to and maintaining it over time.

The Bald Eagle holds significant symbolism and is a revered national symbol in the United States, representing strength, freedom, and resilience. Conservation efforts have helped restore Bald Eagle populations, which were once threatened due to habitat loss and the use of pesticides.

It''s important to note that the Bald Eagle is protected under various laws and regulations to ensure its continued survival and conservation. Disturbing or harming these birds or their nests is strictly prohibited.

Please note that the Bald Eagle is specific to North America, and other eagle species found in different regions may have different characteristics and behaviors.', 1, N'Eagle', 3)
INSERT [dbo].[tbl_Blog] ([blog_id], [thumbnail], [title], [date_update], [content], [description], [status], [hashtag], [bird_id]) VALUES (4, N'4_1.png', N'Crow care guide', NULL, N'To take care of a crow, we need', N'The Cuckoo is a bird species known for its unique behavior and distinctive call. Here''s a description of the Cuckoo bird in English:

The Cuckoo is a medium-sized bird, ranging in size from small to large depending on the species. It typically has a slender body with long wings and a long tail. The plumage of the Cuckoo varies among species, but many have a combination of gray or brown feathers with intricate patterns for camouflage.

Cuckoos are found in various habitats worldwide, including forests, woodlands, grasslands, and even urban areas. They are known for their migratory behavior, with some species undertaking long-distance journeys between breeding and wintering grounds.

One of the most notable characteristics of the Cuckoo is its breeding behavior. Unlike most birds, Cuckoos do not build their own nests or raise their own young. Instead, they are notorious for their brood parasitism. Female Cuckoos lay their eggs in the nests of other bird species, often targeting specific host species. The Cuckoo eggs mimic the appearance of the host species'' eggs, fooling the host into incubating and caring for the Cuckoo chick as if it were their own.

Cuckoos are known for their distinctive call, which varies among species. The familiar "cuckoo" sound is often associated with the common Cuckoo species. Male Cuckoos use their calls to establish territories and attract mates during the breeding season.

The diet of Cuckoos primarily consists of insects, such as caterpillars, beetles, and grasshoppers. They are adept in catching insects in flight or searching for them among foliage. Some Cuckoo species may also consume fruits, seeds, and small vertebrates.

Cuckoos are generally elusive and tend to be solitary or occur in loose groups. They have excellent camouflage and may rely on their cryptic coloration to blend into their surroundings. This makes them challenging to spot despite their presence in various habitats.

While Cuckoos are known for their brood parasitism and unique behaviors, they also play important roles in ecosystems by controlling insect populations and contributing to pollination through their foraging habits.

Please note that the behavior and characteristics of Cuckoos can vary among different species within the Cuculidae family.', 1, N'Crow', 4)
SET IDENTITY_INSERT [dbo].[tbl_Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Category] ON 

INSERT [dbo].[tbl_Category] ([category_id], [name], [status], [img]) VALUES (1, N'Insects', 1, N'img/categories/Insect.png')
INSERT [dbo].[tbl_Category] ([category_id], [name], [status], [img]) VALUES (2, N'Bran', 1, N'img/categories/bran.jpg')
INSERT [dbo].[tbl_Category] ([category_id], [name], [status], [img]) VALUES (3, N'Seeds', 1, N'img/categories/seeds.jpg')
INSERT [dbo].[tbl_Category] ([category_id], [name], [status], [img]) VALUES (4, N'Medicine', 1, N'img/categories/medicine.png')
SET IDENTITY_INSERT [dbo].[tbl_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_LifeCycle] ON 

INSERT [dbo].[tbl_LifeCycle] ([lifecycle_id], [name]) VALUES (1, N'< 3 months')
INSERT [dbo].[tbl_LifeCycle] ([lifecycle_id], [name]) VALUES (2, N'3-12 months')
INSERT [dbo].[tbl_LifeCycle] ([lifecycle_id], [name]) VALUES (3, N'> 12 months')
SET IDENTITY_INSERT [dbo].[tbl_LifeCycle] OFF
GO
INSERT [dbo].[tbl_Meal] ([quantity], [meal_package_id], [product_id], [description]) VALUES (2, 1, 1, NULL)
INSERT [dbo].[tbl_Meal] ([quantity], [meal_package_id], [product_id], [description]) VALUES (1, 1, 2, NULL)
INSERT [dbo].[tbl_Meal] ([quantity], [meal_package_id], [product_id], [description]) VALUES (3, 1, 3, NULL)
INSERT [dbo].[tbl_Meal] ([quantity], [meal_package_id], [product_id], [description]) VALUES (2, 2, 1, NULL)
INSERT [dbo].[tbl_Meal] ([quantity], [meal_package_id], [product_id], [description]) VALUES (3, 2, 2, NULL)
INSERT [dbo].[tbl_Meal] ([quantity], [meal_package_id], [product_id], [description]) VALUES (1, 2, 3, NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_MealPackage] ON 

INSERT [dbo].[tbl_MealPackage] ([meal_package_id], [meal_code], [title_mealpackage], [quantity], [price], [discount_price], [thumbnail], [description], [recipe], [create_at], [update_at], [status], [bird_id], [lifecycle_id], [img]) VALUES (1, N'MP001', N'Meal Package 1', 10, 50000, 45000, N'img/product/details/5-8.jpg', N'A food package for birds, such as for pet birds or wild bird feed, is specifically designed to provide convenient storage and transportation of bird food while ensuring its freshness and quality. These packages are typically tailored to meet the unique needs of avian nutrition and come in various forms depending on the type of bird food being packaged.

Bird food packages often consist of a sturdy outer container, such as a bag or a plastic container, which provides protection against moisture, pests, and physical damage. The material used for the package is typically food-grade and safe for birds. The package may also feature resealable closures, such as zippers or clips, to maintain the freshness of the food and prevent spoilage.

Inside the package, the bird food is often sealed in individual pouches or compartments. This helps to keep the food separate and prevent cross-contamination, ensuring that each serving of food remains hygienic and free from contaminants. In the case of dry bird food, the package may also incorporate moisture-absorbing packets or desiccants to maintain the dryness of the food and extend its shelf life.

The packaging of bird food may also include informative labels with essential details such as the type of bird the food is intended for, nutritional information, feeding guidelines, and any special instructions. This information is crucial for bird owners to understand the specific dietary requirements of their birds and to ensure they are providing appropriate nutrition.', N'Here is a recipe for making natural food for birds using seeds, dried fruits, and vitamins:

Ingredients:
1/2 cup of seeds (e.g., peas, corn, flaxseeds, sunflower seeds)
1/4 cup of seed mix (e.g., grass seeds, rapeseeds, tomato seeds)
1/4 cup of dried fruits (e.g., raisins, dried figs, dried bananas)
1/4 cup of fat seed mix (e.g., flaxseed oil seeds, sunflower oil seeds)
1/4 cup of vitamin mix (available from pet stores or consult a veterinarian)
Purified water

Instructions:
1. Grind the seeds and seed mix in a blender or food processor until finely ground.
2. Mix the ground seed mixture with the dried fruits and fat seed mix.
3. Gradually add purified water and stir until you achieve a sticky paste.
4. Continue stirring until all the ingredients are evenly blended, and the mixture becomes a cohesive mass.
5. Use your hands or a utensil to shape the mixture into small balls or form them into small disks.
6. Place the bird food on an empty tray and let it air dry for a period of time (usually 12 to 24 hours) until the food solidifies.
7. Once it has hardened, the bird food is ready to be served. You can place it in a feeding dish or hang it inside the birdcage.

Note: Ensure that the seeds and fruits you use are safe for birds and do not contain any additives or added sugars. If you are unsure about the safety of an ingredient, consult a veterinarian. This is a basic recipe, but you can adjust the proportions and ingredients to suit the specific type of bird you are feeding.', CAST(N'2023-07-09' AS Date), CAST(N'2023-07-09' AS Date), 1, 1, NULL, N'https://cdn.discordapp.com/attachments/1105697107802849381/1127849021629800540/image.png https://cdn.discordapp.com/attachments/1105697107802849381/1127849083491598366/image.png https://cdn.discordapp.com/attachments/1105697107802849381/1127850450641752205/image.png https://cdn.discordapp.com/attachments/1105697107802849381/1127850521630359662/image.png')
INSERT [dbo].[tbl_MealPackage] ([meal_package_id], [meal_code], [title_mealpackage], [quantity], [price], [discount_price], [thumbnail], [description], [recipe], [create_at], [update_at], [status], [bird_id], [lifecycle_id], [img]) VALUES (2, N'MP002', N'Meal Package 2', 12, 100000, 25000, N'img/product/details/5-9.jpg', N'A meal package for birds typically consists of a combination of nutritious food items that are carefully selected to meet the dietary needs of the specific bird species. These packages are designed to provide a well-balanced diet and ensure the bird receives essential nutrients, vitamins, and minerals for optimal health. Here''s a description of a typical meal package for birds:

1. Seed Mix: A blend of high-quality seeds, such as sunflower seeds, millet, safflower seeds, and various grains, provides a primary source of energy and essential fatty acids for birds.

2. Pellets or Extruded Food: These are formulated food pellets or extruded shapes that offer a balanced nutritional profile. They often contain a mix of seeds, grains, fruits, vegetables, and added vitamins and minerals. Pellets help ensure birds receive a complete diet, especially when specific nutrients may be lacking in seeds alone.

3. Fresh Fruits and Vegetables: A variety of fresh fruits and vegetables can be included in the meal package, such as apples, oranges, grapes, carrots, leafy greens, and bell peppers. These provide essential vitamins, minerals, and antioxidants while adding diversity to the bird''s diet.

4. Sprouted Seeds or Legumes: Sprouted seeds or legumes, such as sprouted mung beans or lentils, can be included to offer additional nutrients and provide a natural source of live enzymes. Sprouting enhances nutrient availability and makes digestion easier for birds.

5. Treats and Supplements: Occasionally, meal packages may include treats like dried mealworms, nuts, or special bird-friendly treats. Additionally, specific supplements like calcium blocks or mineral blocks may be added to support the bird''s overall health.

It''s important to note that the composition of a meal package can vary based on the species, age, and dietary requirements of the bird. Consulting avian experts or veterinarians can provide valuable guidance in creating a meal package that best suits a specific bird''s needs. Additionally, fresh water should always be provided separately for birds to stay hydrated and ensure their well-being.', N'Ingredients:
1/4 cup wheat sprouts
1/4 cup oat bran
1/4 cup finely chopped vegetables (carrots, broccoli, parsley, etc.)
1/4 cup quinoa or brown rice, cooked
1 tablespoon honey
1 tablespoon unsalted nut butter (such as almond or cashew butter)
1 tablespoon fresh herbs, finely chopped (cilantro, parsley, or dill)
Water (if needed to adjust the consistency of the mixture)

Instructions:
1. In a mixing bowl, combine wheat sprouts, oat bran, finely chopped vegetables, cooked quinoa or brown rice, honey, nut butter, and fresh herbs.
2. Gradually add water to the mixture and stir until you achieve a dough-like consistency. The mixture should be sticky but not overly wet or sticky.
3. Take a small portion of the mixture and shape it into small balls or form them into small disks.
4. Place the bird food on a baking tray lined with parchment paper.
5. Refrigerate the bird food for at least 30 minutes to allow it to firm up.
6. Once cooled and hardened, the bird food is ready to be served. You can offer it to your pet bird as a treat or as part of their daily diet.
7. Note: Remember to consult with a veterinarian or avian expert to ensure the ingredients and proportions are suitable for your specific bird species.

This recipe provides a nutritious and flavorful meal for pet birds, combining wheat sprouts and oat bran with vegetables, grains, and other natural ingredients.', CAST(N'2023-07-09' AS Date), CAST(N'2023-07-09' AS Date), 1, 2, NULL, N'img/product/details/5-9.jpg')
SET IDENTITY_INSERT [dbo].[tbl_MealPackage] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Product] ON 

INSERT [dbo].[tbl_Product] ([product_id], [product_code], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id]) VALUES (1, NULL, N'test1', 2, 4, 1, 1, N'FSAD', N'<p>cc</p>', CAST(N'2023-06-11' AS Date), CAST(N'2023-06-17' AS Date), 1, 3, NULL)
INSERT [dbo].[tbl_Product] ([product_id], [product_code], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id]) VALUES (2, NULL, N'Compound feed', 20000, 200000, 220000, 1, N'2_1.png', N'This is compound feed', NULL, NULL, 1, 2, NULL)
INSERT [dbo].[tbl_Product] ([product_id], [product_code], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id]) VALUES (3, NULL, N'Corn seeds', 20000, 8000, 13000, 1, N'3_1.png', N'This is corn seeds', NULL, NULL, 1, 3, NULL)
INSERT [dbo].[tbl_Product] ([product_id], [product_code], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id]) VALUES (4, NULL, N'Growth medicine', 20, 80000, 83000, 10, N'4_1.png', N'This is growth medicine', NULL, NULL, 1, 4, NULL)
INSERT [dbo].[tbl_Product] ([product_id], [product_code], [title], [quantity], [price], [discount_price], [weight], [thumbnail], [description], [create_at], [update_at], [status], [category_id], [feedback_id]) VALUES (6, NULL, N'sad', 1, 2, 1, 1, N'1', N'<p>Dưới đ&acirc;y l&agrave; một c&ocirc;ng thức để l&agrave;m thức ăn tự nhi&ecirc;n cho chim sử dụng c&aacute;c loại hạt, tr&aacute;i c&acirc;y kh&ocirc; v&agrave; vitamin:<br>Nguy&ecirc;n liệu:<br>1/2 ch&eacute;n hạt (v&iacute; dụ: hạt đậu, hạt bắp, hạt lanh, hạt hướng dương)<br>1/4 ch&eacute;n hạt giống (v&iacute; dụ: hạt cỏ, hạt cải dầu, hạt c&agrave; chua)<br>1/4 ch&eacute;n c&aacute;c loại tr&aacute;i c&acirc;y kh&ocirc; (v&iacute; dụ: nho kh&ocirc;, mứt kh&ocirc;, chuối kh&ocirc;, mơ kh&ocirc;)<br>1/4 ch&eacute;n hỗn hợp hạt mỡ (v&iacute; dụ: hạt lanh mỡ, hạt hướng dương mỡ)<br>1/4 ch&eacute;n hỗn hợp vitamin (c&oacute; thể mua sẵn từ c&aacute;c cửa h&agrave;ng th&uacute; cưng hoặc hỏi &yacute; kiến từ b&aacute;c sĩ th&uacute; y)<br>Nước tinh khiết<br>C&aacute;ch l&agrave;m:<br>Xay nhuyễn hạt v&agrave; hạt giống trong m&aacute;y xay hoặc m&aacute;y xay sinh tố cho đến khi nhuyễn mịn.<br>Trộn hỗn hợp hạt nhuyễn với c&aacute;c loại tr&aacute;i c&acirc;y kh&ocirc; v&agrave; hỗn hợp hạt mỡ.<br>Dần dần th&ecirc;m nước tinh khiết v&agrave; khuấy đều cho đến khi bạn đạt được một hỗn hợp nhớt dễ d&aacute;n.<br>Tiếp tục trộn đều cho đến khi tất cả c&aacute;c th&agrave;nh phần được pha trộn đồng đều v&agrave; hỗn hợp trở th&agrave;nh một khối.<br>D&ugrave;ng tay hoặc dụng cụ để tạo th&agrave;nh c&aacute;c vi&ecirc;n nhỏ hoặc h&igrave;nh th&agrave;nh th&agrave;nh c&aacute;c đĩa nhỏ.<br>Đặt thức ăn chim tr&ecirc;n một khay trống v&agrave; để kh&ocirc; tự nhi&ecirc;n trong một khoảng thời gian (thường từ 12 đến 24 giờ) cho đến khi khối thức ăn cứng lại.<br>Sau khi đ&atilde; cứng lại, thức ăn cho chim đ&atilde; sẵn s&agrave;ng để được phục vụ. Bạn c&oacute; thể đặt n&oacute; trong hộp thức ăn hoặc treo l&ecirc;n trong lồng chim.<br>Lưu &yacute;: H&atilde;y đảm bảo c&aacute;c loại hạt v&agrave; tr&aacute;i c&acirc;y bạn sử dụng an to&agrave;n cho chim v&agrave; kh&ocirc;ng chứa chất phụ gia hoặc đường th&ecirc;m v&agrave;o. Nếu bạn kh&ocirc;ng chắc chắn về an to&agrave;n của một th&agrave;nh phần, h&atilde;y tham khảo &yacute; kiến từ b&aacute;c sĩ th&uacute; y.<br>Đ&acirc;y l&agrave; một c&ocirc;ng thức cơ bản, nhưng bạn c&oacute; thể thay đổi tỷ lệ v&agrave; th&agrave;nh phần để ph&ugrave; hợp với loại chim cụ thể m&agrave; bạn đang nu&ocirc;i.<br><br><a href="https://cdn.discordapp.com/attachments/1105697107802849381/1127520838321717319/animal-bird-bullfinch-pyrrhula.png">animal-bird-bullfinch-pyrrhula.png (910&times;614) (discordapp.com)</a></p>', CAST(N'2023-06-11' AS Date), CAST(N'2023-06-17' AS Date), 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[tbl_Product] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Role] ON 

INSERT [dbo].[tbl_Role] ([role_id], [name]) VALUES (1, N'admin')
INSERT [dbo].[tbl_Role] ([role_id], [name]) VALUES (2, N'staff')
INSERT [dbo].[tbl_Role] ([role_id], [name]) VALUES (3, N'customer')
SET IDENTITY_INSERT [dbo].[tbl_Role] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_User] ON 

INSERT [dbo].[tbl_User] ([user_id], [username], [password], [fullname], [email], [phone_number], [address], [status], [role_id]) VALUES (1, N'admin', N'1', N'BMOS admin', N'bmos@gmail.com', N'012345679', N'29/45D, Boston', 1, 1)
INSERT [dbo].[tbl_User] ([user_id], [username], [password], [fullname], [email], [phone_number], [address], [status], [role_id]) VALUES (2, N'staff', N'1', N'BMOS staff', N'staff@gmail.com', N'74185296', N'85/95D, Bussan', 1, 2)
INSERT [dbo].[tbl_User] ([user_id], [username], [password], [fullname], [email], [phone_number], [address], [status], [role_id]) VALUES (3, N'c', N'1', N'BMOS customer', N'cus1@gmail.com', N'741852963', N'8/A5D, British', 1, 3)
SET IDENTITY_INSERT [dbo].[tbl_User] OFF
GO
ALTER TABLE [dbo].[tbl_Blog]  WITH CHECK ADD  CONSTRAINT [FK__tbl_Blog__bird_i__5629CD9C] FOREIGN KEY([bird_id])
REFERENCES [dbo].[tbl_Bird] ([bird_id])
GO
ALTER TABLE [dbo].[tbl_Blog] CHECK CONSTRAINT [FK__tbl_Blog__bird_i__5629CD9C]
GO
ALTER TABLE [dbo].[tbl_Feedback]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_User] ([user_id])
GO
ALTER TABLE [dbo].[tbl_Meal]  WITH CHECK ADD  CONSTRAINT [FK__tbl_Meal__meal_p__4BAC3F29] FOREIGN KEY([meal_package_id])
REFERENCES [dbo].[tbl_MealPackage] ([meal_package_id])
GO
ALTER TABLE [dbo].[tbl_Meal] CHECK CONSTRAINT [FK__tbl_Meal__meal_p__4BAC3F29]
GO
ALTER TABLE [dbo].[tbl_Meal]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_Product] ([product_id])
GO
ALTER TABLE [dbo].[tbl_MealPackage]  WITH CHECK ADD  CONSTRAINT [FK__tbl_MealP__bird___48CFD27E] FOREIGN KEY([bird_id])
REFERENCES [dbo].[tbl_Bird] ([bird_id])
GO
ALTER TABLE [dbo].[tbl_MealPackage] CHECK CONSTRAINT [FK__tbl_MealP__bird___48CFD27E]
GO
ALTER TABLE [dbo].[tbl_MealPackage]  WITH CHECK ADD  CONSTRAINT [FK__tbl_MealP__lifec__49C3F6B7] FOREIGN KEY([lifecycle_id])
REFERENCES [dbo].[tbl_LifeCycle] ([lifecycle_id])
GO
ALTER TABLE [dbo].[tbl_MealPackage] CHECK CONSTRAINT [FK__tbl_MealP__lifec__49C3F6B7]
GO
ALTER TABLE [dbo].[tbl_MealPlan]  WITH CHECK ADD  CONSTRAINT [FK__tbl_MealP__meal___5812160E] FOREIGN KEY([meal_package_id])
REFERENCES [dbo].[tbl_MealPackage] ([meal_package_id])
GO
ALTER TABLE [dbo].[tbl_MealPlan] CHECK CONSTRAINT [FK__tbl_MealP__meal___5812160E]
GO
ALTER TABLE [dbo].[tbl_Order]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_User] ([user_id])
GO
ALTER TABLE [dbo].[tbl_OrderDetail]  WITH CHECK ADD FOREIGN KEY([oder_id])
REFERENCES [dbo].[tbl_Order] ([order_id])
GO
ALTER TABLE [dbo].[tbl_OrderDetail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_Product] ([product_id])
GO
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[tbl_Category] ([category_id])
GO
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD FOREIGN KEY([feedback_id])
REFERENCES [dbo].[tbl_Feedback] ([feedback_id])
GO
ALTER TABLE [dbo].[tbl_User]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[tbl_Role] ([role_id])
GO
USE [master]
GO
ALTER DATABASE [BMOS_v4] SET  READ_WRITE 
GO
