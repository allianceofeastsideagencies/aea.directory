<div align="center">
  <h1>aea-directory</h1>
  <p>
    site to enumerate all of the agencies that make up AEA
  </p>
  <!-- Badges -->
  <p>
    <a href="https://app.netlify.com/projects/aeadirectory/deploys">
      <img src="https://api.netlify.com/api/v1/badges/71ebc32b-c2e8-4eeb-a635-c00a795f4110/deploy-status" alt="Netlify status" />
    </a>
  </p>
</div>

<br />

<!-- Table of Contents -->
# :notebook_with_decorative_cover: Table of Contents

- [Tech Stack](#space_invader-tech-stack)
- [Getting Started](#toolbox-getting-started)
  * [Run Locally](#running-run-locally)
  * [How to author entries](#how-to-author-entries)
- [License](#warning-license)

<!-- TechStack -->
### :space_invader: Tech Stack

<details>
  <summary>Posts</summary>
  <ul>
    <li><a href="https://jekyllrb.com/docs/">Jekyll</a></li>
    <li><a href="https://decapcms.org/docs/intro/">Decap CMS</a></li>
    <li><a href="https://www.netlify.com/">Netlify hosting</a></li>
    <li><a href="https://www.netlify.com/">Netlify DNS</a></li>
  </ul>
</details>

calef maintains the access credentials for these resources.

<!-- Getting Started -->
## 	:toolbox: Getting Started

<!-- Run Locally -->
### :running: Run Locally

Clone the project

```bash
  git clone git@github.com:aea/aea.directory.git
```

Go to the project directory

```bash
  cd aea.directory
```

Install dependencies

```bash
  ./script/bootstrap
```

Start the server

```bash
  ./script/server
```

### :pen: How to author entries

Entries are in \_agencies. Each field means as follows:

- title: The name of the agency.
- agency_url: The URL of the agency.
- categories: The services offered by the agency.

You can create entries via <a href="https://aea.directory/admin">Decap CMS</a>.

<!-- License -->
## :warning: License

Distributed under the CC0 1.0 Universal License. See LICENSE for more information.
