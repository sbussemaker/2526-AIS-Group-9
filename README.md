# Dutch Geospatial Data Integration - Archi model

> [!NOTE]
> This architecture is made as part of the course "Architectures of Information Systems" 2025, taught by University of Twente. The accompanying PoC of this project is found at https://github.com/sbussemaker/2526-AIS-Group-9-POC.

## Case description
Kadaster is the Dutch national land registry and mapping agency and is responsible for maintaining authoritative information about property, land use, and geographic data in the Netherlands. This data is managed through several key registers, including cadastral, topographic, and building information systems, that together form the foundation of the national spatial data infrastructure. Kadaster has developed a Kadaster Knowledge Graph (KKG) to semantically interlink these registers, creating a richer and more connected view of parcels, buildings, rights, and administrative entities.

A growing challenge is how to efficiently integrate new data sources, such as sensor data, environmental models, and energy consumption data, into this ecosystem without requiring full transformation into Linked Data. Many valuable datasets are maintained in relational databases, APIs, or document-based formats, making integration labor-intensive and inconsistent. This limits the ability to combine and analyse information across domains in a timely and scalable way.

At the same time, Kadaster aims to make its integrated data more accessible and actionable for a broad range of use cases. Employees, analysts, and partners often struggle to find or interpret relevant datasets, as technical complexity and differing data models create barriers to discovery and understanding. To address this, Kadaster is exploring how AI assistants, similar to the experimental Loki system, can help users interact naturally with internal and external data sources through the Knowledge Graph, using natural language to ask questions, discover relationships, and generate insights.

## Model development

This architecture was developed with Archi using ArchiMate methodology. The model contains the baseline (as-is) architecture, SWOT analysis and future (to-be) architecture.

### Collaboration

Collaboration on the model was made possible with the [coArchi](https://github.com/archimatetool/archi-modelrepository-plugin/wiki) plugin.

Steps to get started:
1. Download plugin at https://www.archimatetool.com/downloads/coarchi/coArchi_0.9.4.archiplugin
2. Add to Archi in the Help -> Manage Plug-ins -> Install...
    - A new collaboration window appears. I just created a Workspace in GitHub for us to share, you have GitHub accounts right? You'll need this to sign in. Best way to do this, since GitHub has 2FA, is with Personal Access Token (PAT), so create that first
3. GitHub Settings -> Developer -> Personal access token -> Tokens (classic) -> Generate new token -> Generate new token (classic) -> Choose name and expiration, select all repo scopes -> save the generated code
4. Now, in the collaborative workspace in Archi you should be able to Import Remote Model to Workspace. In the next window, fill in:
    - URL: https://github.com/sbussemaker/2526-AIS-Group-9.git
    - User Name: \<your github account name\>
    - Password: The PAT you just generated
