# `AccedingDataverse_CommonDataService.Database()` in Power Query

This guide provides a **complete explanation and practical examples** of the function `AccedingDataverse_CommonDataService.Database()` — used to connect Power Query (Power BI or Excel) to **Microsoft Dataverse** environments.

To start, use get data with Dataverse connector. Then choose the databse on tou choice. Planner data cam be get from "Personal Productivity" db.

---

##  1. Overview

The `AccedingDataverse_CommonDataService.Database()` function is a **Power Query M connector** designed to establish a connection between Power Query and a **Dataverse (Dynamics 365 / Power Apps)** environment.

It enables you to access, browse, and load tables (entities) directly from your organization’s Dataverse environment.

---

## 2. Syntax

```m
AccedingDataverse_CommonDataService.Database(EnvironmentURL as text, optional NavigationOptions as any) as table
```

| Parameter | Type | Description |
|------------|------|-------------|
| **EnvironmentURL** | *text* | The root URL of your Dataverse environment (e.g., `contoso.crm.dynamics.com`). |
| **NavigationOptions** | *optional* | Allows configuration of additional parameters like views, load mode, and query filters. |

---

### ✅ Example 1 – Basic Connection

```m
let
    Source = AccedingDataverse_CommonDataService.Database("contoso.crm.dynamics.com")
in
    Source
```

This example connects to the **Contoso Dataverse environment**, listing all accessible tables and entities.

---

### ✅ Example 2 – Selecting a Specific Table

```m
let
    Source = AccedingDataverse_CommonDataService.Database("contoso.crm.dynamics.com"),
    Accounts = Source{[EntitySetName="accounts"]}[Data]
in
    Accounts
```

**Explanation:**
- The function connects to Dataverse.  
- It accesses the table (entity) named `"accounts"`.  
- The `[Data]` field retrieves the actual table content.

---

### ✅ Example 3 – Using with Filters and Transformations

```m
let
    Source = AccedingDataverse_CommonDataService.Database("contoso.crm.dynamics.com"),
    Contacts = Source{[EntitySetName="contacts"]}[Data],
    ActiveContacts = Table.SelectRows(Contacts, each [statecode] = 0),
    Result = Table.SelectColumns(ActiveContacts, {"fullname", "emailaddress1", "telephone1"})
in
    Result
```

This script:  
1. Connects to Dataverse.  
2. Loads the **Contacts** table.  
3. Filters only **active** contacts (`statecode = 0`).  
4. Selects relevant columns (name, email, and phone).

---

## 3. Key Notes and Behavior

- When first executed, Power Query will prompt for **organizational login credentials**.  
- It uses **OAuth2 authentication** via Microsoft Entra ID (formerly Azure AD).  
- You may need **Power Apps or Dataverse permissions** to access entities.  
- Once connected, your credentials are cached under **Data Source Settings** in Power BI or Excel.

---

## 🔐 4. Authentication Options

| Authentication Type | Description |
|----------------------|-------------|
| **Organizational Account** | Default method. Uses Microsoft Entra (Azure AD) identity. |
| **OAuth2 Token** | Used for advanced or automated connections. |
| **Service Principal** | Recommended for enterprise-level scheduled refreshes. |

---

##  5. Related Functions

| Function | Purpose |
|-----------|----------|
| `CommonDataService.Database()` | The official connector for accessing Dataverse tables. |
| `Dynamics365BusinessCentral.Database()` | Connects to Dynamics 365 Business Central. |
| `OData.Feed()` | Generic connector for OData-based endpoints (Dataverse supports OData). |
| `PowerPlatform.Dataflows()` | Retrieves data from Power Platform dataflows. |

---

##  6. Best Practices

1. **Use environment URLs directly** to avoid confusion between multiple Dataverse instances.  
2. **Limit columns and rows** after connection to reduce data load times.  
3. **Document your entity names** (`EntitySetName`) for easier maintenance.  
4. **Use parameters** in Power Query to store environment URLs and credentials safely.  
5. **Schedule refreshes** in Power BI Service using a service principal when possible.  

---

## 7. Example with Parameters

```m
let
    EnvironmentURL = "contoso.crm.dynamics.com",
    Source = AccedingDataverse_CommonDataService.Database(EnvironmentURL),
    Accounts = Source{[EntitySetName="accounts"]}[Data],
    Final = Table.SelectColumns(Accounts, {"name", "accountnumber", "telephone1"})
in
    Final
```

---

## 8. Troubleshooting

| Issue | Possible Cause | Solution |
|--------|----------------|-----------|
| **Login prompt not appearing** | Cached credentials or invalid session | Clear permissions under *Data Source Settings* |
| **Access denied** | Insufficient Dataverse permissions | Request “Environment Reader” or “System Administrator” role |
| **Empty table list** | Environment mismatch | Check if the correct environment is selected in Power Apps |
| **Connection timeout** | Network or service issue | Retry or use gateway for on-premise refreshes |

---

##  9. Summary

| Feature | Description |
|----------|-------------|
| **Function Name** | `AccedingDataverse_CommonDataService.Database()` |
| **Purpose** | Connect to Microsoft Dataverse environments |
| **Returns** | Table containing entities and data |
| **Requires Login** | Yes – Microsoft organizational account |
| **Use Cases** | Power BI, Excel, Power Query, and data integration with Dataverse |

---

📄 **Author:** Rafaella Romer
📅 **Version:** 1.0  
🔧 **Compatible with:** Power BI / Power Query / Dataverse Connector / Power Apps
