USE [master]
GO
/****** Object:  Database [kuarasy]    Script Date: 15/12/2021 21:41:11 ******/
CREATE DATABASE [kuarasy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kuarasy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\kuarasy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kuarasy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\kuarasy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [kuarasy] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kuarasy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kuarasy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kuarasy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kuarasy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kuarasy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kuarasy] SET ARITHABORT OFF 
GO
ALTER DATABASE [kuarasy] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [kuarasy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kuarasy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kuarasy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kuarasy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kuarasy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kuarasy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kuarasy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kuarasy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kuarasy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [kuarasy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kuarasy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kuarasy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kuarasy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kuarasy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kuarasy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kuarasy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kuarasy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [kuarasy] SET  MULTI_USER 
GO
ALTER DATABASE [kuarasy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kuarasy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kuarasy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kuarasy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kuarasy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kuarasy] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [kuarasy] SET QUERY_STORE = OFF
GO
USE [kuarasy]
GO
/****** Object:  Table [dbo].[avaliacao]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[avaliacao](
	[id_avaliacao] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](255) NULL,
	[comentario] [varchar](max) NULL,
	[nota] [int] NOT NULL,
	[id_comprador] [int] NOT NULL,
	[id_produto] [int] NOT NULL,
 CONSTRAINT [PK_avaliacao] PRIMARY KEY CLUSTERED 
(
	[id_avaliacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](30) NOT NULL,
 CONSTRAINT [PK_categoria] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cidade]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cidade](
	[id_cidade] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](75) NOT NULL,
	[id_estado] [int] NOT NULL,
 CONSTRAINT [PK_cidade] PRIMARY KEY CLUSTERED 
(
	[id_cidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compra]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[id_compra] [int] IDENTITY(1,1) NOT NULL,
	[observacao] [varchar](max) NULL,
	[valor_total] [varchar](40) NULL,
	[data_entrega] [date] NOT NULL,
	[id_comprador] [int] NULL,
	[data_compra] [datetime] NULL,
 CONSTRAINT [PK_compra] PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compra_produto]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra_produto](
	[id_compra] [int] NOT NULL,
	[id_produto] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comprador]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comprador](
	[id_comprador] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
 CONSTRAINT [PK_comprador] PRIMARY KEY CLUSTERED 
(
	[id_comprador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[endereco]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[endereco](
	[id_endereco] [int] IDENTITY(1,1) NOT NULL,
	[cep] [char](10) NOT NULL,
	[rua] [varchar](255) NOT NULL,
	[numero] [int] NOT NULL,
	[bairro] [varchar](255) NOT NULL,
	[logradouro] [varchar](255) NOT NULL,
	[complemento] [varchar](255) NOT NULL,
	[id_cidade] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
 CONSTRAINT [PK_endereco] PRIMARY KEY CLUSTERED 
(
	[id_endereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estado]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](75) NOT NULL,
	[uf] [char](2) NOT NULL,
 CONSTRAINT [PK_estado] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[origem]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[origem](
	[id_origem] [int] IDENTITY(1,1) NOT NULL,
	[pais] [varchar](50) NOT NULL,
	[continente] [varchar](255) NOT NULL,
	[descricao] [varchar](max) NOT NULL,
	[imagem_origem] [varchar](255) NULL,
 CONSTRAINT [PK_origem] PRIMARY KEY CLUSTERED 
(
	[id_origem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[origem_produto]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[origem_produto](
	[id_produto] [int] NOT NULL,
	[id_origem] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[produto]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produto](
	[id_produto] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](255) NOT NULL,
	[preco] [decimal](9, 2) NULL,
	[descricao] [varchar](max) NULL,
	[quantidade] [int] NOT NULL,
	[peso] [float] NOT NULL,
	[imagem] [varchar](255) NULL,
	[id_tamanho] [int] NOT NULL,
	[id_vendedor] [int] NULL,
	[id_tipo] [int] NOT NULL,
	[historia] [varchar](max) NULL,
	[desconto] [decimal](2, 2) NULL,
 CONSTRAINT [PK_produto] PRIMARY KEY CLUSTERED 
(
	[id_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tamanho]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tamanho](
	[id_tamanho] [int] IDENTITY(1,1) NOT NULL,
	[altura] [float] NOT NULL,
	[largura] [float] NOT NULL,
	[comprimento] [float] NOT NULL,
 CONSTRAINT [PK_tamanho] PRIMARY KEY CLUSTERED 
(
	[id_tamanho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefone]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefone](
	[id_telefone] [int] IDENTITY(1,1) NOT NULL,
	[ddd] [int] NOT NULL,
	[numero] [char](9) NOT NULL,
	[tipo_telefone] [varchar](60) NOT NULL,
 CONSTRAINT [PK_telefone] PRIMARY KEY CLUSTERED 
(
	[id_telefone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefone_usuario]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefone_usuario](
	[id_telefone] [int] NOT NULL,
	[id_usuario] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo](
	[id_tipo] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](60) NOT NULL,
	[id_categoria] [int] NOT NULL,
 CONSTRAINT [PK_tipo] PRIMARY KEY CLUSTERED 
(
	[id_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](120) NOT NULL,
	[sobrenome] [varchar](255) NOT NULL,
	[cpf] [char](14) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[data_nascimento] [date] NOT NULL,
	[nacionalidade] [varchar](60) NOT NULL,
	[senha] [nvarchar](max) NOT NULL,
	[tipo_usuario] [tinyint] NOT NULL,
	[imagem] [varbinary](max) NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendedor]    Script Date: 15/12/2021 21:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendedor](
	[id_vendedor] [int] IDENTITY(1,1) NOT NULL,
	[cnpj] [char](14) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[biografia] [nvarchar](max) NULL,
 CONSTRAINT [PK_vendedor] PRIMARY KEY CLUSTERED 
(
	[id_vendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categoria] ON 

INSERT [dbo].[categoria] ([id_categoria], [nome]) VALUES (1, N'Vestuários')
INSERT [dbo].[categoria] ([id_categoria], [nome]) VALUES (2, N'Instrumentos')
INSERT [dbo].[categoria] ([id_categoria], [nome]) VALUES (3, N'Decorações')
INSERT [dbo].[categoria] ([id_categoria], [nome]) VALUES (4, N'Acessórios')
INSERT [dbo].[categoria] ([id_categoria], [nome]) VALUES (5, N'Crenças')
INSERT [dbo].[categoria] ([id_categoria], [nome]) VALUES (6, N'Aromaterapia')
SET IDENTITY_INSERT [dbo].[categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[cidade] ON 

INSERT [dbo].[cidade] ([id_cidade], [nome], [id_estado]) VALUES (1, N'São Paulo', 25)
INSERT [dbo].[cidade] ([id_cidade], [nome], [id_estado]) VALUES (2, N'Rio Verde', 8)
INSERT [dbo].[cidade] ([id_cidade], [nome], [id_estado]) VALUES (3, N'Vitória', 7)
INSERT [dbo].[cidade] ([id_cidade], [nome], [id_estado]) VALUES (4, N'Anajatuba', 9)
SET IDENTITY_INSERT [dbo].[cidade] OFF
GO
SET IDENTITY_INSERT [dbo].[estado] ON 

INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (1, N'Acre', N'AC')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (2, N'Alagoas', N'AL')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (3, N'Amapá', N'AP')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (4, N'Amazonas', N'AM')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (5, N'Bahia', N'BA')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (6, N'Ceará', N'CE')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (7, N'Espírito Santo', N'ES')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (8, N'Goiás', N'GO')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (9, N'Maranhão', N'MA')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (10, N'Mato Grosso', N'MT')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (11, N'Mato Grosso do Sul', N'MS')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (12, N'Minas Gerais', N'MG')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (13, N'Pará', N'PA')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (14, N'Paraíba', N'PB')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (15, N'Paraná', N'PR')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (16, N'Pernambuco', N'PE')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (17, N'Piauí', N'PI')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (18, N'Rio de Janeiro', N'RJ')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (19, N'Rio Grande do Norte', N'RN')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (20, N'Rio Grande do Sul', N'RS')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (21, N'Rondônia', N'RO')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (22, N'Roraima', N'RR')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (23, N'Santa Catarina', N'SC')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (25, N'São Paulo', N'SP')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (26, N'Sergipe', N'SE')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (27, N'Tocantins', N'TO')
INSERT [dbo].[estado] ([id_estado], [nome], [uf]) VALUES (28, N'Distrito Federal', N'DF')
SET IDENTITY_INSERT [dbo].[estado] OFF
GO
SET IDENTITY_INSERT [dbo].[origem] ON 

INSERT [dbo].[origem] ([id_origem], [pais], [continente], [descricao], [imagem_origem]) VALUES (1, N'Bolívia', N'América', N'A Bolívia é um país da parte central da América do Sul, com relevo variado que inclui a cordilheira dos Andes, o deserto de Atacama e a floresta tropical da bacia do rio Amazonas. Bolivianos são os habitantes nativos da Bolívia. As etnias indígenas mais relevantes são a dos quíchuas e dos aimarás. Os descendentes de espanhóis e mestiços compõem o resto da população boliviana. A tradição boliviana conjuga influências na música e dança pré-inca, espanhola, amazônica e inclusive a africana A cultura boliviana é considerada uma das mais ricas da américa Latina, e em todas as suas manifestações culturais é evidente o sincretismo religioso, que mistura o cristianismo a ecos das culturas Inca e Aymara. Em algumas regiões a influência africana também é viva, além das danças diabladas sincréticas que simbolizam a luta do Bem contra o Mal. O artesanato boliviano é um dos mais ricos e coloridos da América Latina, suas confecções possuem beleza, diversidade de cores e detalhes que remetem a cultura e a essência desses povos.', N'bolivia.png')
INSERT [dbo].[origem] ([id_origem], [pais], [continente], [descricao], [imagem_origem]) VALUES (2, N'Colômbia', N'América', N'A Colômbia é um país no extremo norte da América do Sul. Sua paisagem é marcada por florestas tropicais, pela Cordilheira dos Andes e por várias plantações de café.

A Colômbia é um país cuja diversidade cultural é originária do contato entre os povos nativos e colonizadores espanhóis. Apesar da miscigenação populacional, há uma ampla predominância do aspecto religioso católico.

A Arte pré-colombiana é uma designação que compreende todas as manifestações artísticas levadas a cabo pelos povos nativos mesoamericanos, anteriores à conquista da América Latina pelos espanhóis e portugueses.

O artesanato colombiano faz parte da cultura do país antes mesmo da chegada dos espanhóis no continente, ou seja, ele data antes mesmo do século XVI. Ele era feito pelos índios que habitavam a região. Algumas de suas técnicas são utilizadas até os dias de hoje, aperfeiçoadas pelas novas gerações.', N'colombia.png')
INSERT [dbo].[origem] ([id_origem], [pais], [continente], [descricao], [imagem_origem]) VALUES (3, N'Paraguai', N'América', N'O Paraguai é um país sem saída para o mar que faz fronteira com a Argentina, o Brasil e a Bolívia. Ele tem grandes faixas de pantanal, floresta subtropical e Chaco, uma região selvagem que consiste em savanas e matagais. O Paraguai ainda guarda orgulhosamente seu passado indígena. A língua guarani é falada por grande parte da população juntamente com o espanhol. Desta maneira vemos marcas da cultura guarani em todas as áreas artísticas mescladas com os costumes trazidos pelos colonizadores espanhóis. O ñanditu é o trabalho artesanal típico do Paraguai que mais chama a atenção. Ele é quase todo produzido em Itaguá. A renda foi criada pelos índios guaranis, e sua origem é contada em uma lenda que reza ter havido, em uma tribo, uma filha de cacique de formosura ímpar. Acredita-se que a origem do ñanduti seja a ilha de Tenerife, na Espanha, de onde mulheres partiam para a América do Sul para se casar com os colonizadores espanhóis. Com elas chegaram os bordados brancos e delicados que se tornaram uma identidade das paraguaias.', N'paraguai.png')
INSERT [dbo].[origem] ([id_origem], [pais], [continente], [descricao], [imagem_origem]) VALUES (4, N'Peru', N'América', N'O Peru é um país da América do Sul que abriga uma parte da Floresta Amazônica e Machu Picchu, uma antiga cidade inca na cordilheira dos Andes. A cultura do Peru é rica e carrega vestígios de seus povos nativos e um sincretismo com os costumes e tradições de seus colonizadores espanhóis. Em todas as cidades visitadas, podemos ver na arquitetura, costumes, gastronomia um pouco da história do povo local. O artesanato peruano é repleto de cores vivas e detalhes surpreendentes. Suas artes remetem às tradições incas e a seus antigos artesãos que, por centenas de anos, desenvolveram esta atividade, utilizando os mais variados materiais disponíveis e sempre expressando as principais experiências do povo andino.', N'peru.png')
INSERT [dbo].[origem] ([id_origem], [pais], [continente], [descricao], [imagem_origem]) VALUES (5, N'Venezuela', N'América', N'A Venezuela é um país situado na costa norte da América do Sul com diversas atrações naturais. Ao longo da costa do Caribe, há ilhas turísticas tropicais como a Islã de Margarita e o arquipélago Los Roques.
Cultura. A cultura venezuelana trata-se de uma cultura de três civilizações: africanos, indígenas e espanhóis. A cultura, de um modo geral, assemelha-se à cultura da América Latina. A gastronomia provém das tribos indígenas e dos espanhóis, a música e as artes pictóricas dos africanos e a língua dos espanhóis.
Importância do artesanato, é que por meio dele, os povos indígenas das etnias Warao e E’ñepa expressam sua cultura, sua identidade e sua ligação com os elementos da natureza.', N'venezuela.png')
INSERT [dbo].[origem] ([id_origem], [pais], [continente], [descricao], [imagem_origem]) VALUES (6, N'Angola', N'África', N'Angola é um país no sul da África, com um território que abrange praias tropicais do Atlântico, além de um sistema labiríntico de rios e desertos subsaarianos que se estende até a Namíbia.

Angola, como a grande maioria dos países independentes da África é um estado multi e transcultural. Isto quer dizer que abriga em seu território diversas culturas, com línguas, costumes e origens diferentes, que muitas vezes extrapolam as fronteiras políticas estabelecidas pelos europeus no século XIX. A cultura angolana é por um lado tributária das etnias que se constituíram no país há séculos - principalmente os Ovimbundos, ambundos, congos, chócues e Ovambos.

Os artesãos angolanos são bons mestres na arte de trabalhar o marfim e a madeira. Esta peça, chamada “O pensador” é uma das mais famosas do artesanato em madeira e constitui um referencial da cultura angolana. Representa a figura de um ancião, que pode ser um homem ou uma mulher.', N'angola.png')
INSERT [dbo].[origem] ([id_origem], [pais], [continente], [descricao], [imagem_origem]) VALUES (7, N'Moçambique', N'África', N'Moçambique é uma nação do sul da África cujo longo litoral no Oceano Índico é permeado de praias conhecidas, como Tofo, e de parques marinhos perto da costa. No arquipélago Quirimbas, uma faixa de 250 quilômetros de ilhas de corais, a ilha do Ibo, coberta por manguezais, tem ruínas da era colonial que sobreviveram desde o período do domínio português. O arquipélago de Bazaruto, mais ao sul, tem recifes que protegem espécies marinhas raras, como os dugongos.

Traduzido do inglês-A cultura de Moçambique é em grande parte derivada de sua história do domínio Bantu, suaíli e português, e se expandiu desde a independência em 1975. A maioria de seus habitantes são africanos negros. Seu idioma principal é o português. Moçambique sempre se afirmou como pólo cultural com intervenções marcantes, de nível internacional, no campo da arquitectura, pintura, música, literatura e poesia. Nomes como Malangatana, Mia Couto e José Craveirinha entre outros, já há muito ultrapassaram as fronteiras Nacionais.

O artesanato local, nos dias de hoje, assenta em trabalhos em madeira variados (em que se inclui a construção naval), cestaria, missangas e panos usados na confecção de trajes e diversos artigos . Nos tempos aúreos da Ilha de Moçambique, existiam inúmeros artesãos que se dedicavam a várias artes como a joalharia e o trabalho em filigrana (em retrocesso pela dificuldade de obtenção de matéria-prima), a construção de riquexós e de barcos.

Nos tempos aúreos da Ilha de Moçambique, existiam inúmeros artesãos que se dedicavam a várias artes como a joalharia e o trabalho em filigrana (em retrocesso pela dificuldade de obtenção de matéria-prima), a construção de riquexós e de barcos.', N'moçambique.png')
INSERT [dbo].[origem] ([id_origem], [pais], [continente], [descricao], [imagem_origem]) VALUES (8, N'Haiti', N'América', N'O Haiti é um país caribenho que compartilha a Ilha de São Domingos com a República Dominicana, localizada ao leste.

A cultura do Haiti possui raízes com características marcantes da região oeste da África, além de ser influenciada pela França devido à sua colonização, como é notável em sua música, religião e linguagem. A cultura também engloba contribuições adicionais do nativo Taino e imperialismo espanhol.

o Artesanato haitiano possui muita presença e riqueza de cores brilhantes, perspectiva ingênua e humor astuto são características da arte haitiana. Alimentos deliciosos, e paisagens exuberantes são temas favoritos nesta terra de pobreza e fome. Ir ao mercado é a atividade mais social da vida no campo, e figura proeminente na discussão do assunto. Animais da selva, rituais, danças, e os deuses evocam o passado Africano.

Artistas também pintam em fábula. As pessoas estão disfarçados de animais e os animais se transformam em pessoas. Símbolos podem assumir grande significado. Por exemplo, um galo, muitas vezes representa Aristide e as cores vermelho e azul da bandeira haitiana, muitas vezes representam o seu partido Lavalas.', N'haiti.png')
INSERT [dbo].[origem] ([id_origem], [pais], [continente], [descricao], [imagem_origem]) VALUES (9, N'China', N'Ásia', N'A China é uma nação muito populosa da Ásia Oriental cuja ampla paisagem abrange pradarias, desertos, montanhas, lagos, rios e mais de 14.000 km de litoral.

A China está entre as quatro civilizações mais antigas do mundo, juntamente com Egito, Índia e Babilônia. No país de dimensões continentais, somente a escrita já tem mais de 3,6 mil anos.

A riqueza de informações milenar chinesa passeia pela arte, caligrafia, culinária, dança, música, literatura, artes marciais, medicina, religião, astrologia, arquitetura e comportamento.

Segundo alguns historiadores, a arte chinesa é a corrente mais antiga do mundo e conta com uma história de mais de 3000 anos. Conhecida por uma tradição sólida, que se manteve apesar de diferentes dinastias, a estética desse movimento teve como foco o equilíbrio e a beleza.', N'china.png')
INSERT [dbo].[origem] ([id_origem], [pais], [continente], [descricao], [imagem_origem]) VALUES (10, N'Coreia', N'Ásia', N'A Coreia do Sul, uma nação do Leste da Ásia localizada na metade sul da Península da Coreia, compartilha uma das fronteiras mais militarizadas do mundo com a Coreia do Norte.

A cultura da Coreia do Sul deriva da cultura tradicional coreana, que é compartilhada com a Coreia do Norte. Ao longo da história, a cultura coreana foi influenciada pela guerra. ... A cultura tradicional também foi influenciada pelo budismo, taoísmo e confucionismo, porém hoje existem muitos sul coreanos que são cristãos.

Há mais mistérios por trás do artesanato coreano do que sonha nossa vã filosofia. Suas cores, formas, desenhos e costuras enchem os olhos com a sua beleza e delicadeza. Além de funcionais no dia a dia, também são verdadeiras obras de arte expostas mundo afora. Mas nesse trabalho milenar há muito mais que o esforço e a dedicação do artesão. Cada peça carrega uma simbologia e traz consigo a história das mulheres da dinastia Joseon (1392 – 1910), que transformaram as limitações de sua época em uma forte e característica expressão cultural – o *gyubang*.', N'coreia.png')
INSERT [dbo].[origem] ([id_origem], [pais], [continente], [descricao], [imagem_origem]) VALUES (11, N'Japão', N'Ásia', N'O Japão, país insular no Oceano Pacífico, tem cidades densas, palácios imperiais, parques nacionais montanhosos e milhares de santuários e templos.

O Japão exibe uma cultura multifacetada, com tradições milenares. Embora tenha raízes na cultura chinesa, a distância geográfica permitiu ao Japão a construção de um modelo cultural diferenciado e cujas marcas persistem mesmo com a característica dinâmica do povo de adaptar-se à evolução tecnológica.

O artesanato no Japão tem uma longa tradição e história. Incluem-se o artesanato de um indivíduo ou grupo, ou um trabalho produzido por artistas de estúdio independentes, trabalhando com materiais e / ou processos artesanais tradicionais.', N'japao.png')
SET IDENTITY_INSERT [dbo].[origem] OFF
GO
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (2, 1)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (3, 1)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (4, 1)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (6, 2)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (7, 2)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (8, 3)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (9, 4)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (10, 4)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (11, 6)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (12, 6)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (13, 9)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (14, 9)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (15, 9)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (17, 10)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (18, 8)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (19, 8)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (20, 8)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (21, 5)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (22, 5)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (25, 7)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (26, 7)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (34, 11)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (35, 9)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (36, 11)
INSERT [dbo].[origem_produto] ([id_produto], [id_origem]) VALUES (33, 11)
GO
SET IDENTITY_INSERT [dbo].[produto] ON 

INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (2, N'Colar do Altiplano', CAST(1300.00 AS Decimal(9, 2)), N'A peça original é da Bolívia, uma antiga peça fetichista em metal branco com os intrincados desenhos típicos do passado e da cultura de sua região. Preservei os elementos focais, de dois tamanhos e o final de sua cadeia.', 5, 0.10000000149011612, N'Colar do Altiplano-5ae5480c8e079e38978a32c52cdcf22d.jpg', 2, NULL, 2, N'Uma opala peruana incomum e interessante parecia uma combinação perfeita. Estas contas não são como a opala peruana normal. Têm áreas cinzentas, translúcidas, algumas azuis aqui e ali e lapidação rústica - são cortadas à mão no Peru - e têm algumas áreas ásperas, deliciosas e magníficas, distantes das versões comerciais desta pedra. -Estou SEMPRE em busca de contas não comerciais  O cinza em algumas das pedras se funde lindamente com o metal antigo que ainda tem sua pátina original e talvez tenha sido banhado a prata “em algum momento”…  Uma conta de ágata solitária com faixas acrescenta impacto e contraste, a única parte que não é do Altiplano, já que até o fio é de alpaca peruana.  OOAK, com alto impacto visual.', CAST(0.40 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (3, N'Escultura de Madeira', CAST(110.00 AS Decimal(9, 2)), N'Escultura em madeira de Francisco Graciano.  Nesta peça, inspirou-se em um indígena andino.', 50, 0.20000000298023224, N'Escultura de Madeira-escultura-em-madeira-boliviano-arte-popular.jpg', 3, NULL, 20, N'A madeira é a matéria-prima que Francisco Graciano usa para manifestar o seu imaginário.  Quando pega a madeira que vem a ideia na cabeça do que vai fazer.  “Eu costumo dizer é que eu não sei fazer é nada. Tem uma voz assim na cabeça, do meu lado que vai dizendo o que é pra fazer. Pra mim é como uma voz de um espírito índio (...) Gosto de ficar sozinho, distraído da cabeça e quando eu chego eu já tenho as imagens na cabeça”.', CAST(0.40 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (4, N'Charango Profissional', CAST(2000.19 AS Decimal(9, 2)), N'Charango profissional com detalhes de tatu talhado, a madeira naranjilho fornece ao instrumento um maravilhoso som que supera outros charangos de caparação de tatu.  Tampo: Pinheiro Abeto y Jacarandá Diapasão: Jacarandá Tipo de madeira: Naranjilho Boca: Desenho exclusivo Cordas: Nylon Cravelhas: Metálicas Cavalete: Jacarandá boliviano e pestana de osso Escala: 37.5 Afinação: Mi 4.40 (De notas baixas a notas altas: Sol, Do, Mi, La, Mi)', 2, 1.7000000476837158, N'Charango Profissional-IMCHA302_M.jpg', 4, NULL, 12, N'O charango é um instrumento nascido em América, que deriva da Vihuela. Foi muito difundido em Bolivia e Perú. É um cordófono, pertencente ao grupo dos compostos no que o portacordas e a caixa não se podem separar sem destruir o instrumento. Originalmente era fabricado com diversos tipos de caparação de armadillo. Também conhecido como tatu. Na actualidade constrói-se maioritariamente em madeira para dar uma melhor resonancia e evitar a extinção do Quirquincho. Possui dez cordas plásticas agrupadas em cinco pares com as seguintes notas (de abaixo a acima): MI • LA • MI (uma à oitava inferior) • DO • SOL.', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (6, N'Tambor Urubu-Kaapor', CAST(349.99 AS Decimal(9, 2)), N'Tambor de pele constituído de um cilindro de madeira não identificada fechado, nos dois lados, com pele de animal não identificado, fixadas [as peles em ambos os lados] por compressão por meio de cilindros de cipó roliço, também não identificado. Apresenta fixado aos cilindros de cipó fios de algodão, tecidos segundo a técnica da torção em “z”, formando chevrons.', 3, 6, N'Tambor Urubu-Kaapor-1981-8122-bgoeldi-15-1-e20180128-gf03.jpg', 7, NULL, 14, N'A equivalência de elementos estruturais pode, no entanto, ser observada na configuração deles, e é isso que distingue o tambor Ka’apor de outros membranofones. Como exemplo: a disposição das amarras de cipó nas extremidades do tambor para segurar as peles (couro animal, embora não possamos afirmar que se trate sempre de pele de macaco); as sementes de awa’ir em seu interior, para ter o efeito de maracá, quando agitado; as pequenas baquetas mirara ir; e o fio de algodão que envolve o mesmo, sempre de forma similarmente entrecruzada. São essas características singulares que o tornam distinto e particular no conjunto da cultura material deste povo.', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (7, N'Bolsa artesanal de miçangas coloridas', CAST(80.00 AS Decimal(9, 2)), N'bolsa artesanal colombiana, feita à mão, de miçangas coloridas, com alça transversal longa e zíper. ', 0, 0.20000000298023224, N'Bolsa artesanal de miçangas coloridas-73e3c98b50acf831e8ae7419d2d58ec8.jfif', 8, NULL, 4, N'A história das miçangas no mundo é muito mais antiga do que se possa imaginar. Os primeiros centros de produção teriam surgido no Egito e na Mesopotâmia, entre os anos de 2400 e 1600 A.C, como registra a exposição "No Caminho da Miçanga: um mundo que se faz de contas", inaugurada 2015 no Museu do Índio, com curadoria da antropóloga Els Lagrou. O nome vem de "masanga", palavra de origem africana que significa "contas de vidro miúdas". Aqui no Brasil, elas chegaram no século XVI pelas mãos de grupos franceses que comercializavam com os índios Tupinambá da costa brasileira. Logo, diversas tribos se apropriaram das miçangas em suas culturas e começaram a criar seus próprios costumes e mitos em torno delas.', CAST(0.20 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (8, N'Blusa vermelha bordada em ao po''i', CAST(129.99 AS Decimal(9, 2)), N'O bordado à mão com algodão cru e tecido aó po’i, por isso são muito aceitas no mercado internacional', 3, 0.10000000149011612, N'Blusa vermelha bordada em ao po''i-Untitled.png', 9, NULL, 11, N'Uma das principais riquezas culturais do Paraguai é o aó po’i, significa ‘roupa fina’ e também pode ser usado para a confecção de roupas típicas de dança. Resultante de um trabalho manual bastante primoroso, esse tecido, é usado para confeccionar diversas roupas usadas para danças típicas. ', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (9, N'Poncho Hippie Peruano', CAST(100.95 AS Decimal(9, 2)), N'Agasalho peruano com bolsos frontais e capuz, são bem quentinhos e macios, possuem uma boa elasticidade e se adequam a vários tamanhos, pois adaptam-se ao corpo.', 12, 0.10000000149011612, N'Poncho Hippie Peruano-Untitled.png', 10, NULL, 10, N'A origem do traje é indígena. Usado há milhares de anos pelas populações nativas dos Andes, o poncho teve seu uso disseminado pelo restante da população como proteção contra os rigores do clima. ... Na região andina (no Peru, no Equador e na Bolívia, por exemplo), é feito de lã de lhama, de vicunha ou de alpaca.', CAST(0.10 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (10, N'Zampoña Peruana Artesanal', CAST(750.00 AS Decimal(9, 2)), N'A zampoña é construída com cana de bambu natural. Possui duas filas separadas de tubos abertos em uma extremidade e fechados na outra; cada um deles dá uma nota na escala musical. Geralmente há uma fileira de seis tubos, chamada de ira, e uma fileira de sete, chamada de arca.', 4, 0.30000001192092896, N'Zampoña Peruana Artesanal-Untitled (2).png', 11, NULL, 13, N'A zampoña é um instrumento de origem da Cordilheira dos Andes, utilizado principalmente no planalto andino e em países como Peru, Argentina, Bolívia, Chile, Colômbia, Equador. Seu desenvolvimento começou por volta do século V. Desde aquela época, houve uma grande variedade deles.', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (11, N'Máscara de madeira angolana', CAST(2999.99 AS Decimal(9, 2)), N'Produto resistente por causa de ótima qualidade na matéria prima, madeira Lingnum Vitae.', 5, 0.40000000596046448, N'Máscara de madeira angolana-Untitled.png', 12, NULL, 21, N'Na aldeia Tschibinda-Ilunga ainda há as máscaras de Cikungu e de Cihongo que evocam as imagens da mitologia de Lunda-Cokwe. Nessa tradição angolana há a princesa Lweji e o príncipe da civilização Tschibinda-Ilunga são considerados os personagens principais. São usadas durante as cerimônias de circuncisão. Essa cerimônia acontece na própria aldeia. Faz parte da tradição deles a mudança na rotina dos meninos de dez a catorze anos, quando eles vão para a mukanda (circuncisão). Mas antes de isso acontecer, há toda uma preparação pela qual eles devem passar. Nessa fase pré-operatória, eles aprendem canções, músicas, danças da etnia e trabalho artesanais, sempre ministrados por operadores, ajudantes e professores. Quando há mais de um menino que vai entrar na puberdade, os pais se reúnem para combinar o dia da festa que marcará a entrada de seus filhos na mukanda.', CAST(0.20 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (12, N'Máscara Chokwe – Angola. sec. XIX.', CAST(4800.00 AS Decimal(9, 2)), N'Esta bela máscara pwo ou mwana pwo, com uma linha de cabelo elaborada composta por um tecido trançado de fibras, e padrões incomuns de escarificação na testa e face são originários do povo Chokwe de Angola. Pwo significa feminilidade e uma fêmea ancestral idosa associada à fertilidade. A forma cruzada na testa, conhecida como cingelyengelye, é uma influência portuguesa adiantada.', 2, 0.5, N'Máscara Chokwe – Angola. sec. XIX.-Untitled (1).png', 13, NULL, 21, N'Representa a soma de elementos símbólicos e místicos, usadas em rituais e funerais. Os africanos acreditam no poder da absorção das forças mágicas dos espíritos, obtendo a cura de doentes, entre outras coisas. São criadas a partir do barro, marfim, metais, mas o material mais utilizado é a madeira.', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (13, N'Flauta mestre artesanal', CAST(1200.59 AS Decimal(9, 2)), N'Características de redwood xiao:  Tom exato  Altos agudos soprando Não é fácil de quebrar, boa estabilidade. Cada flauta é refinada e afinada pelo mestre.  Cada flauta é selecionada por um professor famoso para garantir que a qualidade do som, timbre e sensibilidade atinjam um alto nível.', 100, 0.10000000149011612, N'Flauta mestre artesanal-Untitled.png', 14, NULL, 13, N'Nas pinturas das cavernas é possível se observar desenhos de flautas e apitos, o que comprova a presença deste instrumento desde 60.000 A.C. O mais antigo instrumento já encontrado é uma espécie de flauta, feita através de um fragmento do fêmur de um jovem urso das cavernas, com dois a quatro furos, encontrado em Divje Babe na Eslovênia e teria cerca de 43 mil anos.  Em 2008, outra flauta fabricada há pelo menos 35 mil anos foi descoberta na caverna Hohle Fels perto de Ulm na Alemanha. A flauta de cinco furos tem um bocal em forma de V e é feita a partir de um osso de asa de abutre. A descoberta é também a mais antiga já confirmada referente a qualquer instrumento musical na história.', CAST(0.70 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (14, N'Vaso de Porcelana Chinesa', CAST(132.00 AS Decimal(9, 2)), N'Vaso de porcelana chinesa em perfeito estado, feito é personalizado a mão!', 10, 1.6000000238418579, N'Vaso de Porcelana Chinesa-Untitled (1).png', 17, NULL, 18, N'A porcelana surgiu na China há mais de 1.700 anos, porém foi na dinastia Tang (618 – 907) que ganhou notoriedade. Ninguém sabe ao certo como ela surgiu, mas acredita-se que foi um forno que ultrapassou a temperatura habitual para confecção da cerâmica e acabou dando origem às primeiras peças em porcelana.  A tecnologia foi aperfeiçoada durante a Dinastia Yuan (1279-1368), quando os mestres ceramistas chineses descobriram o óxido de cobalto com os persas. Aplicado na porcelana branca e em seguida cozido a 1200ºC, o cobalto resultava em um lindo tom de azul, que ficava mais forte ou mais fraco de acordo com as pinceladas. O azul era uma das cores favoritas dos persas por simbolizar a água – “o tesouro do deserto”.  Estava criada a porcelana decorativa azul e branca, um clássico do decor que conquistaria o mundo!', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (15, N'Incensário Artesanal Chines ', CAST(149.99 AS Decimal(9, 2)), N'Incensário artesanal de cerâmica com globo de cristal, decoração criativa para sua casa! Conteúdo: 1 queimador de incenso e 20 cones de incenso  Aplicações: casa, escritório, hotel, casa de chá, estúdio de ioga, meditação, templo budista, sala de estar etc.  Eficácia: ar fresco, acalmar os nervos, ajudar o foco, decoração etc.  Importante: a cerâmica é frágil e este produto tem um risco comparavelmente maior de quebra, devido à sua forma irregular, se você receber um produto quebrado, entre em contato conosco diretamente sem hesitação para um reenvio. ', 100, 0.34999999403953552, N'Incensário Artesanal Chines -Dragao.png', 18, NULL, 26, N'A origem do dragão chinês não é precisa, mas muitos estudiosos concordam que se originou dos totens de diferentes tribos na China. Pesquisadores acreditam que sua representação surgiu por volta de 6 mil AC, sendo que sua representação mais antiga foi encontrada em Henan, ao sul de Pequim.', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (17, N'Leque Coreano Dos Anos 60 Pintado À Mão', CAST(64.99 AS Decimal(9, 2)), N'Leque coreano original dos anos 60 pintado a mão com imagens de festa tradicional do interior da Coreia', 18, 0.15000000596046448, N'Leque Coreano Dos Anos 60 Pintado À Mão-Untitled (2).png', 20, NULL, 27, N'Kim Dong-sik é um mestre artesão de hapjukseon – leques dobráveis tradicionais.  O artesão de 77 anos começou a aprender as técnicas para fazer os leques em Jeonju, Jeolla do Norte quando tinha apenas 14 anos (1956). Seu avô materno Rah Hak-cheon que trabalhava fazendo leques dobráveis para o Rei Gojong no final da Dinastia Joseon (1392-1910) foi seu mentor. Como estima-se que o leque de hapjukseon remonta à Dinastia Goryeo (918-1392), ele oferece algumas informações sobre os tempos antigos – Os leques feitos com 50 tiras de bambu só podiam ser usados pelo rei e a família real, e os nobres usavam leques feitos com 40 tiras de bambu. Aqueles com menos de 40 faixas eram para as classes mais baixas.', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (18, N'Replica do Quadro - Haitian Market by Sea', CAST(7999.99 AS Decimal(9, 2)), N'Réplica perfeita do quadro Haitian Market by Sea originado pelo haitiano Castera Bazile, construída a base de óleo sobre masonite.', 2, 7.8000001907348633, N'Replica do Quadro - Haitian Market by Sea-Untitled.png', 22, NULL, 19, N'O falecido mestre haitiano Castera Bazile começou a trabalhar no Centre d''art em 1944, ajudando os alunos de Dewitt Peter com os elementos necessários para as disciplinas de natureza morta. Ele logo desenvolveu um interesse por flores e composição, e um dia, ele começou a se pintar. Ele pintou três dos murais da Catedral Episcopal da Santíssima Trindade em 1951. Em 1955, ele participou com sucesso de várias exposições no Art Center e no exterior - os Estados Unidos e a Europa. Ele ganhou o grande prêmio da Competição Internacional do Caribe patrocinada pela Alcoa Corporation e o grande prêmio de US $ 1.000 em um concurso da Holiday Magazine. Suas figuras são freqüentemente delineadas. Em 1966, Bazile morreu prematuramente no auge de sua carreira.', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (19, N'Escultura de busto de Mulher Haitiana', CAST(5100.00 AS Decimal(9, 2)), N'Escultura de busto de Mulher Haitiana em esculpida em pedra, com elementos policromados, assinada na base', 1, 34.889999389648438, N'Escultura de busto de Mulher Haitiana-3106600_2.jpg', 23, NULL, 20, N'Ronald Laratte nasceu em Porto Príncipe, no Haiti, em 1964. Com a idade de doze anos, iniciou seu aprendizado como escultor de pedra na oficina de seu pai, George Laratte, um dos principais escultores do Haiti. As esculturas de pedra de Ronald retratam a beleza, a sensualidade e a divindade das mulheres. Expôs na Alemanha o Ministério do Comércio em 1987, Nova Iorque em 1989, o México em 1994, a Flórida em 1995, Santo Domingo em 1996, a Martinica e a Aliança Francesa em 1997', CAST(0.40 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (20, N'Haitiano Vasos De Madeira', CAST(60.00 AS Decimal(9, 2)), N'Vasos Decorativos de Cor Marrom Escuro com Enfeite de Artesanato Tradicional', 4, 0.5, N'Haitiano Vasos De Madeira-Untitled (2).png', 24, NULL, 18, N'Vasos feitos com muito carinho e amor.', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (21, N'La guarura adptada', CAST(85.99 AS Decimal(9, 2)), N'Feito com uma concha do mar que consiste em uma abertura ou bocal para sua execução. É usado em festivais tradicionais, como a dança de macacos no estado de Monagas.', 24, 0.40000000596046448, N'La guarura adptada-Untitled (1).png', 25, NULL, 13, N'La Guarura é um instrumento musical soprado pelo vento , constituído por uma concha de caracol marinho com um orifício no ápice, que serve de porta-voz. O guarurá corre lábios vibrantes enquanto sopra para produzir um som alto e penetrante. Seu som é áspero e enérgico, e requer muito esforço para tocá-lo. O guarurá acompanha os tambores de cumaco durante as festividades em homenagem a San Juan Bautista , especialmente nas cidades do estado de Vargas. O usado na Venezuela é grande, cujo toque pode ser ouvido a grande distância (cerca de 500 metros). Para atingir essa potência sonora, o caracol é trespassado pela parte delgada do cone, por onde é inserido um pequeno cilindro de metal, que funciona como porta-voz.', CAST(0.10 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (22, N'Cesta Artesanal de Palha do Buriti', CAST(179.00 AS Decimal(9, 2)), N'Projeto desenvolvido pelo Museu a Casa do Objeto Brasileiro junto às artesãs Warao, em condição de refúgio, nas cidades de Boa Vista e Paracaima, em Roraima, Brasil. Material: Palha de Buriti Fair Trade (Comércio justo)', 10, 1.2999999523162842, N'Cesta Artesanal de Palha do Buriti-Untitled.png', 26, NULL, 3, N'Esta cesta com alça é um objeto artesanal feito com a palha de buriti, arte ancestral do povo indígena Warao, da Venezuela.  O grupo Nona Nonamo ("Mulheres que tecem" ou Mulheres que são artesãs", no idioma Warao) é formado por mulheres indígenas Warao que, a partir da palha de buriti, utilizam suas técnicas de artesanato como forma de garantir que o modo de vida desta etnia se perpetue, mesmo com os vários desafios do deslocamento forçado.   Ao comprar este artesanato você estará contribuindo e participando ativamente do objetivo do grupo de , interculturalmente, divulgar a história e a realidade dessa comunidade.  O povo indígena Warao é oriundo do Delta Amacuro, região nordeste da Venezuela. Warao, na língua nativa, significa "Povo da Água"ou "Povo da Canoa". A água, assim como o buriti, é um aspecto central da cosmologia desta comunidade. Devido à crise venezuelana, muitos indígenas se deslocaram para o Brasil, estando hoje presentes em estados do Norte e Nordeste, muitos deles em situação de abrigamento.', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (25, N'Escultura Moçambicana', CAST(4599.99 AS Decimal(9, 2)), N'Escultura feita em madeira maciça com verniz para dar um toque especial ao trabalho de qualidade', 2, 8, N'Escultura Moçambicana-Untitled.png', 31, NULL, 20, N'Escultor Moçambicano, nascido em 1964 natural de Gaza, distrito deChongoene, teve o primeiro contacto com a arte em 1983, ingressando nascooperativas de artesanato criadas no bairro em que residia onde aprendeu aesculpir com os artesãos locais. Na altura trabalhava como professor e era nosseus tempos livres que passava conversando com os artesãos que se apaixonoupela arte de esculpir.   Em 1984 a zona em que lecionava foi atingida pela Guerra CivilMoçambicana (Guerra dos 16 anos). Desde então passou a dedicar-se a tempointeiro as artes, tornando-se um mestre na arte de esculpir a madeira.  Cria, acessórios, bustos,estatuetas entre outras criações.  As suas obras têm acabamentos e detalhes feitos com maestria, emsândalo, pau- preto , mbawa entre outras madeiras locais.', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (26, N'Colar Dogon', CAST(300.00 AS Decimal(9, 2)), N'Multi Estilos Retro Vintage África Longo Colar Artesanal Talão Longo Colares Pingentes Para As Mulheres-Declaração de Jóias', 6, 0.20000000298023224, N'Colar Dogon-weddingbeadsmaliorigemdascontasveneza_thumb.jpg', 32, NULL, 2, N'Todas as mulheres na África Ocidental usavam esses colares de contas de vidro, mas em Mali iniciou-se a tradição do uso desses colares  especialmente no casamento.

As jóias também desempenham um papel relevante na vida do povo Dogon. Artisticamente, o povo Dogon têm recebido notoriedade por obras, tais como, as escadas tribais, as portas e janelas entalhadas e as máscaras.', CAST(0.00 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (33, N'Lanterna Japonesa - Torô', CAST(380.00 AS Decimal(9, 2)), N'Traz beleza e harmonia para seu jardim, casa, ambiente. Um ambiente harmônico e belo traz tranquilidade, paz de espirito e a sensação de bem estar.

Torô é uma luminária tradicional do Extremo Oriente. No Japão foram originalmente utilizados em templos budistas para iluminar e alinhar os caminhos.

Essa peça é feito de cimento e pintado com resina, tornando uma peça impermeável, resistente e durável, podendo ficar em área externa. Possui ligação elétrica para uma lâmpada.', 3, 18, N'Lanterna Japonesa - Torô-D_NQ_NP_872906-MLB47518944973_092021-O.jfif', 39, NULL, 28, N'Somente no início da Era Showa (1925~1989), o toro começou a ser apreciado e após a 2ª Guerra Mundial é que ela passou a ser considerada de primeira qualidade, como a conhecemos atualmente. Ao lado do atum, aparece o pargo (tai, em japonês), que é um peixe de carne branca.', CAST(0.30 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (34, N'Chaleira - Porcelana Japonesa', CAST(349.99 AS Decimal(9, 2)), N'Queremos deixar a peça mais original, resistente e com acabamento impecável e para isso utilizamos os melhores materiais do mercado para oferecer para você uma peça ou o jogo completo para ter uma vida útil muito mais longa. ', 120, 0.5, N'Chaleira - Porcelana Japonesa-H973407a4d6b94a799105e7f259ddd76bU_1024x1024@2x.jpg', 40, NULL, 27, N'Maneki Neko significa literalmente (gato acenando) e se caracteriza por um gato sentado com uma das patas levantada. Maneki Neko, conhecido também como Gato da Sorte, esse talismã é muito especial para os japoneses para atrair muita sorte, proteção, prosperidade, felicidade e saúde.', CAST(0.10 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (35, N'Buda Chinês Sorridente Da Riqueza Flor De Lótus', CAST(99.00 AS Decimal(9, 2)), N'Peça confeccionada em Resina de Alta Qualidade, muito resistente e ótimo acabamento.
Pintura artesanal: por ser uma peça pintada à mão, pode haver uma pequena variação na tonalidade da foto.', 2, 1.2999999523162842, N'Buda Chinês Sorridente Da Riqueza Flor De Lótus-estatua_buda_chines_sorridente_da_riqueza_flor_de_lotus_24cm_1031_1031_1_20190801173356.jpg', 41, NULL, 22, N'Buda sorridente: Segundo Feng Shui, ajuda a iluminar as ideias e atrai prosperidade. Dica: Para conseguir pagar as suas dívidas, você deve colocar a imagem de Buda de costas para a porta de entrada de seu lar, com algumas moedas ao redor. Quando conseguir se livrar das contas, desvire a imagem.O Buda da abundância também é conhecido como Ho tei ou Bu Dai, que significa amoroso, amistoso, simpático.', CAST(0.25 AS Decimal(2, 2)))
INSERT [dbo].[produto] ([id_produto], [nome], [preco], [descricao], [quantidade], [peso], [imagem], [id_tamanho], [id_vendedor], [id_tipo], [historia], [desconto]) VALUES (36, N'Amosfun 3 peças de pratos japoneses', CAST(116.11 AS Decimal(9, 2)), N'Ainda está usando uma tigela comum para guardar seu molho de comida? Experimente nossa placa de tempero, ela não vai te decepcionar. Perfeito para mergulho individual, como ketchup para batatas fritas, manteiga para pingar camarão, chutney e azeite de oliva, etc. Feito de material de cerâmica, prático e durável.', 6, 0.30000001192092896, N'Amosfun 3 peças de pratos japoneses-Untitled (2).png', 42, NULL, 27, N'A história da culinária japonesa começa por volta do sé- culo III A.C. com a introdução do cultivo do arroz. ... O arroz começou a exercer uma forte influência no estilo de vida das tribos. Além do uso como alimento o arroz tam- bém era utilizado na fabricação do papel, da bebida (saquê) e como alimento para os animais.', CAST(0.00 AS Decimal(2, 2)))
SET IDENTITY_INSERT [dbo].[produto] OFF
GO
SET IDENTITY_INSERT [dbo].[tamanho] ON 

INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (1, 30, 25, 56)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (2, 30, 25, 56)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (3, 8, 39, 0)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (4, 25, 10, 73)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (7, 26.5, 17, 17)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (8, 10, 15.5, 12)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (9, 35, 45, 55)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (10, 60, 130, 85)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (11, 17, 7, 2)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (12, 37, 25, 29)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (13, 40, 28, 32)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (14, 50, 5, 5)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (17, 21.5, 9.5, 12)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (18, 20, 10, 19)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (20, 56, 88, 3)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (22, 61, 305, 4)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (23, 70, 40, 36)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (24, 35, 25, 25)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (25, 10, 13, 9)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (26, 6, 30, 30)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (31, 48, 30, 26)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (32, 30, 30, 60)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (39, 42, 28, 28)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (40, 25, 13, 16)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (41, 24, 16, 16.5)
INSERT [dbo].[tamanho] ([id_tamanho], [altura], [largura], [comprimento]) VALUES (42, 2.5, 11, 11)
SET IDENTITY_INSERT [dbo].[tamanho] OFF
GO
SET IDENTITY_INSERT [dbo].[telefone] ON 

INSERT [dbo].[telefone] ([id_telefone], [ddd], [numero], [tipo_telefone]) VALUES (1, 11, N'986332802', N'Celular')
INSERT [dbo].[telefone] ([id_telefone], [ddd], [numero], [tipo_telefone]) VALUES (2, 64, N'968873634', N'Celular')
INSERT [dbo].[telefone] ([id_telefone], [ddd], [numero], [tipo_telefone]) VALUES (3, 27, N'969537150', N'Celular')
INSERT [dbo].[telefone] ([id_telefone], [ddd], [numero], [tipo_telefone]) VALUES (4, 98, N'37673156 ', N'Telefone')
INSERT [dbo].[telefone] ([id_telefone], [ddd], [numero], [tipo_telefone]) VALUES (5, 68, N'31605248 ', N'Telefone')
INSERT [dbo].[telefone] ([id_telefone], [ddd], [numero], [tipo_telefone]) VALUES (6, 17, N'24958722 ', N'Telefone')
INSERT [dbo].[telefone] ([id_telefone], [ddd], [numero], [tipo_telefone]) VALUES (7, 13, N'988588176', N'Celular')
INSERT [dbo].[telefone] ([id_telefone], [ddd], [numero], [tipo_telefone]) VALUES (8, 14, N'967674683', N'Celular')
INSERT [dbo].[telefone] ([id_telefone], [ddd], [numero], [tipo_telefone]) VALUES (10, 12, N'975284248', N'Celular')
INSERT [dbo].[telefone] ([id_telefone], [ddd], [numero], [tipo_telefone]) VALUES (11, 11, N'976578353', N'Celular')
SET IDENTITY_INSERT [dbo].[telefone] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo] ON 

INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (1, N'Brinco', 4)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (2, N'Colar', 4)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (3, N'Pulseira', 4)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (4, N'Bolsa', 4)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (5, N'Chapéu', 4)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (7, N'Chaveiro', 4)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (8, N'Vestido', 1)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (9, N'Saia', 1)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (10, N'Poncho', 1)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (11, N'Blusa', 1)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (12, N'Corda', 2)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (13, N'Sopro', 2)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (14, N'Percussão', 2)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (18, N'Vaso', 3)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (19, N'Quadro', 3)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (20, N'Escultura', 3)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (21, N'Mascara', 3)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (22, N'Buda', 5)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (23, N'Vudo', 5)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (24, N'Velas', 6)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (25, N'Incenso', 6)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (26, N'Incensário', 6)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (27, N'Mão', 4)
INSERT [dbo].[tipo] ([id_tipo], [nome], [id_categoria]) VALUES (28, N'Iluminária', 3)
SET IDENTITY_INSERT [dbo].[tipo] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id_usuario], [nome], [sobrenome], [cpf], [email], [data_nascimento], [nacionalidade], [senha], [tipo_usuario], [imagem]) VALUES (1, N'Luiz', N'da Silva', N'25666655086   ', N'luiz@gmail.com', CAST(N'1999-05-12' AS Date), N'Brasileiro', N'12345678', 0, NULL)
INSERT [dbo].[usuario] ([id_usuario], [nome], [sobrenome], [cpf], [email], [data_nascimento], [nacionalidade], [senha], [tipo_usuario], [imagem]) VALUES (2, N'Maria Aparecida', N'Oliveira', N'93726828028   ', N'maria.aparecida@gmail.com', CAST(N'1970-12-11' AS Date), N'Brasileira', N'23456789', 1, NULL)
INSERT [dbo].[usuario] ([id_usuario], [nome], [sobrenome], [cpf], [email], [data_nascimento], [nacionalidade], [senha], [tipo_usuario], [imagem]) VALUES (3, N'Fernando', N'Lopez', N'79508141018   ', N'fernando@gmail.com', CAST(N'1999-11-04' AS Date), N'Boliviano', N'34567891', 1, NULL)
INSERT [dbo].[usuario] ([id_usuario], [nome], [sobrenome], [cpf], [email], [data_nascimento], [nacionalidade], [senha], [tipo_usuario], [imagem]) VALUES (5, N'Samuel', N'Martinez', N'40307649083   ', N'samuel@gmail.com', CAST(N'1986-03-01' AS Date), N'Colombiano', N'45678910', 1, NULL)
INSERT [dbo].[usuario] ([id_usuario], [nome], [sobrenome], [cpf], [email], [data_nascimento], [nacionalidade], [senha], [tipo_usuario], [imagem]) VALUES (6, N'Luiza', N'Flores', N'30247828009   ', N'luiza@gmail.com', CAST(N'1992-04-01' AS Date), N'Peruana', N'56789101', 1, NULL)
INSERT [dbo].[usuario] ([id_usuario], [nome], [sobrenome], [cpf], [email], [data_nascimento], [nacionalidade], [senha], [tipo_usuario], [imagem]) VALUES (8, N'Jeovania', N'Rui Marques', N'78798709038   ', N'jeovania.rui@gmail.com', CAST(N'2000-07-07' AS Date), N'Angolana', N'67891012', 1, NULL)
INSERT [dbo].[usuario] ([id_usuario], [nome], [sobrenome], [cpf], [email], [data_nascimento], [nacionalidade], [senha], [tipo_usuario], [imagem]) VALUES (9, N'Aranca', N'Sozinho', N'45209216004   ', N'aranca@gmail.com', CAST(N'1966-10-08' AS Date), N'Moçambicano', N'78910123', 1, NULL)
INSERT [dbo].[usuario] ([id_usuario], [nome], [sobrenome], [cpf], [email], [data_nascimento], [nacionalidade], [senha], [tipo_usuario], [imagem]) VALUES (10, N'Jin', N'Chen', N'82168129061   ', N'jin.chen@gmail.com', CAST(N'1987-01-05' AS Date), N'Chines', N'89101234', 1, NULL)
INSERT [dbo].[usuario] ([id_usuario], [nome], [sobrenome], [cpf], [email], [data_nascimento], [nacionalidade], [senha], [tipo_usuario], [imagem]) VALUES (11, N'Jaccius', N'Augustin', N'26478202011   ', N'jaccius@gmail.com', CAST(N'1974-09-02' AS Date), N'Haitiano', N'91012345', 1, NULL)
INSERT [dbo].[usuario] ([id_usuario], [nome], [sobrenome], [cpf], [email], [data_nascimento], [nacionalidade], [senha], [tipo_usuario], [imagem]) VALUES (13, N'Klender', N'Hideo', N'52161506099   ', N'klender@gmail.com', CAST(N'1990-06-11' AS Date), N'Venezuelano', N'10123456', 1, NULL)
INSERT [dbo].[usuario] ([id_usuario], [nome], [sobrenome], [cpf], [email], [data_nascimento], [nacionalidade], [senha], [tipo_usuario], [imagem]) VALUES (14, N'Fabiana', N'Soares', N'77439702050   ', N'fabi.fabulosa@gmail.com', CAST(N'1998-01-01' AS Date), N'Brasileira', N'11234567', 0, NULL)
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[vendedor] ON 

INSERT [dbo].[vendedor] ([id_vendedor], [cnpj], [id_usuario], [biografia]) VALUES (7, N'08353879000167', 5, NULL)
INSERT [dbo].[vendedor] ([id_vendedor], [cnpj], [id_usuario], [biografia]) VALUES (8, N'38796094000120', 3, NULL)
INSERT [dbo].[vendedor] ([id_vendedor], [cnpj], [id_usuario], [biografia]) VALUES (9, N'49693906000128', 6, NULL)
INSERT [dbo].[vendedor] ([id_vendedor], [cnpj], [id_usuario], [biografia]) VALUES (10, N'77486410000119', 8, NULL)
INSERT [dbo].[vendedor] ([id_vendedor], [cnpj], [id_usuario], [biografia]) VALUES (11, N'24587065000143', 9, NULL)
INSERT [dbo].[vendedor] ([id_vendedor], [cnpj], [id_usuario], [biografia]) VALUES (12, N'43039016000110', 10, NULL)
INSERT [dbo].[vendedor] ([id_vendedor], [cnpj], [id_usuario], [biografia]) VALUES (13, N'76505437000149', 11, NULL)
INSERT [dbo].[vendedor] ([id_vendedor], [cnpj], [id_usuario], [biografia]) VALUES (14, N'71972214000178', 13, NULL)
SET IDENTITY_INSERT [dbo].[vendedor] OFF
GO
ALTER TABLE [dbo].[avaliacao]  WITH CHECK ADD  CONSTRAINT [avaliacao_id_comprador_fk] FOREIGN KEY([id_comprador])
REFERENCES [dbo].[comprador] ([id_comprador])
GO
ALTER TABLE [dbo].[avaliacao] CHECK CONSTRAINT [avaliacao_id_comprador_fk]
GO
ALTER TABLE [dbo].[avaliacao]  WITH CHECK ADD  CONSTRAINT [avaliacao_id_produto_fk] FOREIGN KEY([id_produto])
REFERENCES [dbo].[produto] ([id_produto])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[avaliacao] CHECK CONSTRAINT [avaliacao_id_produto_fk]
GO
ALTER TABLE [dbo].[cidade]  WITH CHECK ADD  CONSTRAINT [cidade_id_estado_fk] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estado] ([id_estado])
GO
ALTER TABLE [dbo].[cidade] CHECK CONSTRAINT [cidade_id_estado_fk]
GO
ALTER TABLE [dbo].[compra]  WITH CHECK ADD  CONSTRAINT [compra_id_comprador_fk] FOREIGN KEY([id_comprador])
REFERENCES [dbo].[comprador] ([id_comprador])
GO
ALTER TABLE [dbo].[compra] CHECK CONSTRAINT [compra_id_comprador_fk]
GO
ALTER TABLE [dbo].[compra_produto]  WITH CHECK ADD  CONSTRAINT [compraproduto_id_compra_fk] FOREIGN KEY([id_compra])
REFERENCES [dbo].[compra] ([id_compra])
GO
ALTER TABLE [dbo].[compra_produto] CHECK CONSTRAINT [compraproduto_id_compra_fk]
GO
ALTER TABLE [dbo].[compra_produto]  WITH CHECK ADD  CONSTRAINT [compraproduto_id_produto_fk] FOREIGN KEY([id_produto])
REFERENCES [dbo].[produto] ([id_produto])
GO
ALTER TABLE [dbo].[compra_produto] CHECK CONSTRAINT [compraproduto_id_produto_fk]
GO
ALTER TABLE [dbo].[comprador]  WITH CHECK ADD  CONSTRAINT [comprador_id_usuario_fk] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[comprador] CHECK CONSTRAINT [comprador_id_usuario_fk]
GO
ALTER TABLE [dbo].[endereco]  WITH CHECK ADD  CONSTRAINT [endereco_id_cidade_fk] FOREIGN KEY([id_cidade])
REFERENCES [dbo].[cidade] ([id_cidade])
GO
ALTER TABLE [dbo].[endereco] CHECK CONSTRAINT [endereco_id_cidade_fk]
GO
ALTER TABLE [dbo].[endereco]  WITH CHECK ADD  CONSTRAINT [endereco_id_usuario_fk] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[endereco] CHECK CONSTRAINT [endereco_id_usuario_fk]
GO
ALTER TABLE [dbo].[origem_produto]  WITH CHECK ADD  CONSTRAINT [origemproduto_id_origem_fk] FOREIGN KEY([id_origem])
REFERENCES [dbo].[origem] ([id_origem])
GO
ALTER TABLE [dbo].[origem_produto] CHECK CONSTRAINT [origemproduto_id_origem_fk]
GO
ALTER TABLE [dbo].[origem_produto]  WITH CHECK ADD  CONSTRAINT [origemproduto_id_produto_fk] FOREIGN KEY([id_produto])
REFERENCES [dbo].[produto] ([id_produto])
GO
ALTER TABLE [dbo].[origem_produto] CHECK CONSTRAINT [origemproduto_id_produto_fk]
GO
ALTER TABLE [dbo].[produto]  WITH CHECK ADD  CONSTRAINT [produto_id_tamanho_fk] FOREIGN KEY([id_tamanho])
REFERENCES [dbo].[tamanho] ([id_tamanho])
GO
ALTER TABLE [dbo].[produto] CHECK CONSTRAINT [produto_id_tamanho_fk]
GO
ALTER TABLE [dbo].[produto]  WITH CHECK ADD  CONSTRAINT [produto_id_tipo_fk] FOREIGN KEY([id_tipo])
REFERENCES [dbo].[tipo] ([id_tipo])
GO
ALTER TABLE [dbo].[produto] CHECK CONSTRAINT [produto_id_tipo_fk]
GO
ALTER TABLE [dbo].[produto]  WITH CHECK ADD  CONSTRAINT [produto_id_vendedor_fk] FOREIGN KEY([id_vendedor])
REFERENCES [dbo].[vendedor] ([id_vendedor])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[produto] CHECK CONSTRAINT [produto_id_vendedor_fk]
GO
ALTER TABLE [dbo].[telefone_usuario]  WITH CHECK ADD  CONSTRAINT [telefoneusuario_id_telefone_fk] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[telefone_usuario] CHECK CONSTRAINT [telefoneusuario_id_telefone_fk]
GO
ALTER TABLE [dbo].[telefone_usuario]  WITH CHECK ADD  CONSTRAINT [telefoneusuario_id_usuario_fk] FOREIGN KEY([id_telefone])
REFERENCES [dbo].[telefone] ([id_telefone])
GO
ALTER TABLE [dbo].[telefone_usuario] CHECK CONSTRAINT [telefoneusuario_id_usuario_fk]
GO
ALTER TABLE [dbo].[tipo]  WITH CHECK ADD  CONSTRAINT [tipo_id_categoria_fk] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[tipo] CHECK CONSTRAINT [tipo_id_categoria_fk]
GO
ALTER TABLE [dbo].[vendedor]  WITH CHECK ADD  CONSTRAINT [vendedor_id_usuario_fk] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[vendedor] CHECK CONSTRAINT [vendedor_id_usuario_fk]
GO
USE [master]
GO
ALTER DATABASE [kuarasy] SET  READ_WRITE 
GO
