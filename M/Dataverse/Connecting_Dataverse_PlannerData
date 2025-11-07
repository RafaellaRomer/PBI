#  Connecting Power Query to Microsoft Dataverse

This guide explains how to **find your Dataverse environment URL** and use it inside **Power Query** to connect to your organization’s data.

---

## 1.  Find the Dataverse Environment URL

### Step 1 – Access Power Apps
Go to the Power Apps portal:  
 [https://make.powerapps.com](https://make.powerapps.com)

---

### Step 2 – Select the Correct Environment
In the upper-right corner of the Power Apps interface, make sure you’ve selected the correct **environment** — the one that contains your company’s Dataverse data.

---

### Step 3 – Go to Advanced Settings
1. Click the **gear icon** (⚙️) in the top-right corner.  
2. Select **Advanced Settings** (or **Admin center**, if that option is shown instead).  
   This will usually open a new browser tab.

---

### Step 4 – Copy the Root URL
In the new tab that opens (often the older Dynamics 365 admin interface), look at the **address bar**.

You only need the **root part** of the URL — it typically looks like:

```
https://[your-company-name].crm.dynamics.com
```

**Example:**  
If the full URL is:

```
https://contoso.crm.dynamics.com/main.aspx?... 
```

Then your server address is:

```
contoso.crm.dynamics.com
```

---

## 2. Use the URL in Power Query

Once you have the server address (the **root URL**), you can use it in your Power Query M function.

### Syntax

```m
= CommonDataService.Database("YOUR_ENVIRONMENT_URL")
```

###  Example

```m
= CommonDataService.Database("contoso.crm.dynamics.com")
```

When you execute this function, Power Query will prompt you to **sign in with your organization’s credentials**, and then it will allow you to browse and select tables and entities from your **Dataverse environment**.

---

## 3.  Alternatives to Find the URL

If you can’t find **Advanced Settings** or if the Power Apps interface has changed, try one of these alternatives:

| Option | Description |
|--------|--------------|
| **Model-Driven App URL** | Open any model-driven app — the environment name will appear in the browser’s address bar. |
| **Leave it Blank** | When using the Dataverse connector in Power Query, leave the server field blank — it will list all environments you can access so you can select the right one. |

---

### Summary

| Step | Action | Result |
|------|---------|---------|
| 1 | Go to [Power Apps](https://make.powerapps.com) | Access your environments |
| 2 | Select Environment | Ensure correct workspace |
| 3 | Advanced Settings | Access admin configuration |
| 4 | Copy URL | Use in Power Query |
| 5 | Apply in `CommonDataService.Database()` | Connect to Dataverse |

---

📄 **Author:** Rafaella Romer 
📅 **Version:** 1.0  
🔧 **Compatible with:** Power BI / Power Query / Dataverse Connector
