 

/****** Object:  Table [CTRL].[MasterOracleToSTG]    Script Date: 7/15/2024 2:36:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [CTRL].[MasterOracleToSTG](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SourceTableName] [nvarchar](128) NOT NULL,
	[SourceFilterCondition] [nvarchar](max) NULL,
	[SourceQuery] [nvarchar](max) NULL,
	[TargetTableName] [nvarchar](128) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [CTRL].[MasterOracleToSTG] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO

ALTER TABLE [CTRL].[MasterOracleToSTG] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO

ALTER TABLE [CTRL].[MasterOracleToSTG] ADD  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO



 
/****** Object:  Table [CTRL].[MappingOracleToSTG]    Script Date: 7/15/2024 2:36:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [CTRL].[MappingOracleToSTG](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MasterId] [int] NULL,
	[SourceColumnName] [nvarchar](128) NOT NULL,
	[SourceDataType] [nvarchar](128) NULL,
	[SourceCustomConvert] [nvarchar](255) NULL,
	[TargetColumnName] [nvarchar](128) NOT NULL,
	[TargetDataType] [nvarchar](128) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
	[UpdatedBy] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [CTRL].[MappingOracleToSTG] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO

ALTER TABLE [CTRL].[MappingOracleToSTG] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO

ALTER TABLE [CTRL].[MappingOracleToSTG] ADD  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO

ALTER TABLE [CTRL].[MappingOracleToSTG]  WITH CHECK ADD  CONSTRAINT [FK_Mapping_Master] FOREIGN KEY([MasterId])
REFERENCES [CTRL].[MasterOracleToSTG] ([Id])
GO

ALTER TABLE [CTRL].[MappingOracleToSTG] CHECK CONSTRAINT [FK_Mapping_Master]
GO





 

/****** Object:  Table [LOG].[CSOracleToSTG]    Script Date: 7/15/2024 2:35:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [LOG].[CSOracleToSTG](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StepName] [nvarchar](128) NULL,
	[StepMessage] [nvarchar](128) NOT NULL,
	[StepErrorMessage] [nvarchar](max) NOT NULL,
	[LoadID] [uniqueidentifier] NULL,
	[IsError] [bit] NULL,
	[LoadTimeStamp] [datetime] NULL,
	[LoadedBy] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [LOG].[CSOracleToSTG] ADD  DEFAULT (getdate()) FOR [LoadTimeStamp]
GO

ALTER TABLE [LOG].[CSOracleToSTG] ADD  DEFAULT (suser_sname()) FOR [LoadedBy]
GO






