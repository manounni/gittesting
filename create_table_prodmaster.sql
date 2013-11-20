/*****************************************************************************
** Copyright ©2012 DEMATIC Corporation
**
** This software contains confidential information, trade secret information
** and/or know-how which is the property of Siemens Corporation.
** This software is furnished under license and may be used only in accordance
** with the terms of such license and with the inclusion of the above
** copyright notice.  This software may not be provided or otherwise made
** available to any other person or party.  No title to or ownership of the
** software is hereby transferred.
** ---------------------------------------------------------------------------
**
** Revision Information:
**    $Author $ 
**    $Id $
**    $Revision $
**    $Date $
**    $HeadURL $
**
** Description:
**    stores parts info
**       
   +-------------------------+---------------------------------------------------------------------------------------------------------------------------------+
   |Column name              |         Description                                                                                                             |
   |-------------------------+---------------------------------------------------------------------------------------------------------------------------------|
   |orderline_key            |        - identity key generated for each row to maintain foreign key ref                                                        |
   |order_key                |        - references the order number in the orders table                                                                        |
   |line_number              |        - line number within the order downloaded by WMS                                                                         |
   |part_number              |        - part number of the item, this is for reference purpose only and is used only to display                                |
   |                         |                                                                                                                                 |
   |asn_number               |        - this is the unique barcode that will be scanned by the sorter and at the cubbies                                       |
   |case_number              |        - case number of the item, this is for reference purpose only and is used only to display                                |
   |expected_qty             |        - quantity ordered, this is for reference purpose only and is used only to display                                       |
   |carton_deleted           |        - it is possible to delete a carton thru the delete message by WMS                                                       |
   |product_type_key         |        - identifies if it is a FULLCASE, SPLITCASE or NONCONV product, this is a foreign key to the producttypes table          |
   |location_key             |        - identifies the location from where this item needs to be picked                                                        |
   |user_key                 |        - for future use and is not currently used. This came part of the meetings, nothing is defined yet.                      |
   |msg_id_num               |        - downloaded by WMS in ORDERHDR                                                                                          |
   |createdtime              |        - record creation time                                                                                                   |
   |updatedtime              |        - record update time                                                                                                     |
   +-------------------------+---------------------------------------------------------------------------------------------------------------------------------+

******************************************************************************
*/
/*
   IF OBJECT_ID('CTM.prodmaster') IS NOT NULL
   BEGIN
      DROP TABLE CTM.prodmaster;
   END

*/

/****************************************************************************/
PRINT ''
PRINT '*** ---------------------------------- ***'
PRINT '*** Create_Table_prodmaster.sql Procedure Begin. ***'
PRINT ''
/****************************************************************************/
go

/****************************************************************************/
PRINT ''
PRINT '*** Turning off messages about number of rows affected. ***'
/****************************************************************************/
go 
SET nocount on
go


/****************************************************************************/
PRINT ''
PRINT '*** Creating Table prodmaster. ***'
go
/****************************************************************************/


CREATE TABLE CTM.prodmaster
(
   prod_key                         CTM.udt_prod_key                     NOT NULL IDENTITY(1,1),
   prod_id                          CTM.udt_prod_id                     NOT NULL,
   prod_description                 CTM.udt_description                 NULL,
   created_time                     DATETIME                            NOT NULL,
   updated_time                     DATETIME                            NOT NULL 
) ON [PRIMARY]
go


ALTER TABLE CTM.prodmaster ADD CONSTRAINT PK_prodmaster PRIMARY KEY CLUSTERED (prod_key) ON [PRIMARY]
go

ALTER TABLE CTM.prodmaster  ADD CONSTRAINT DF_prodmaster_CreatedTime DEFAULT (GETDATE()) FOR created_time
GO

ALTER TABLE CTM.prodmaster  ADD CONSTRAINT DF_prodmaster_updatedtime DEFAULT (GETDATE()) FOR updated_time
GO
                                                       
CREATE NONCLUSTERED INDEX IX_prodmaster_prod ON CTM.prodmaster(prod)  ON [INDEX] 
go
                                                                 
--CREATE NONCLUSTERED INDEX IX_prodmaster_upc_code ON CTM.prodmaster(upc_code)  ON [INDEX] 
--go

/****************************************************************************/
PRINT ''
PRINT '*** Create_Table_prodmaster.sql Procedure Complete. ***'
PRINT '*** ------------------------------------- ***'
/****************************************************************************/
GO
