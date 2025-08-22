# Manuel d'utilisation des Snippets LuaSnip

## 📁 Structure des fichiers

Créez vos fichiers JSON de snippets dans : `~/.config/nvim/lua/snippets/`

```
~/.config/nvim/
├── lua/
│   └── snippets/
│       ├── react.json
│       ├── javascript.json
│       ├── general.json
│       └── ...
```

## 📝 Format des snippets

### Format VS Code (recommandé)

```json
{
  "nom_du_snippet": {
    "prefix": "trigger",
    "body": ["ligne 1", "ligne 2 avec ${1:placeholder}"],
    "description": "Description optionnelle",
    "import": "import Something from 'somewhere';"
  }
}
```

### Format array (alternatif)

```json
[
  {
    "trigger": "cc",
    "snippet": "class ${1:ClassName} {\n  constructor() {\n    ${0}\n  }\n}",
    "description": "Class component"
  }
]
```

## 🎯 Placeholders

### Placeholders simples

| Syntaxe | Description                  | Exemple              |
| ------- | ---------------------------- | -------------------- |
| `$1`    | Premier placeholder          | `function ${1}() {}` |
| `$2`    | Deuxième placeholder         | `const ${1} = ${2};` |
| `$0`    | Dernière position du curseur | `return ${1};$0`     |

**Exemple :**

```json
{
  "function": {
    "prefix": "fn",
    "body": [
      "function ${1:name}(${2:params}) {",
      "  ${3:// body}",
      "  return ${0};",
      "}"
    ]
  }
}
```

### Placeholders avec valeurs par défaut

| Syntaxe            | Description                        | Exemple                            |
| ------------------ | ---------------------------------- | ---------------------------------- |
| `${1:default}`     | Placeholder avec valeur par défaut | `const ${1:myVar} = null;`         |
| `${2:hello world}` | Valeur par défaut multi-mots       | `console.log("${2:hello world}");` |

**Exemple :**

```json
{
  "react_state": {
    "prefix": "us",
    "body": ["const [${1:state}, set${1cap:State}] = useState(${2:null});"]
  }
}
```

## 🔄 Transformations de placeholders

### Transformations de casse

| Syntaxe      | Résultat                  | Exemple d'entrée → Sortie |
| ------------ | ------------------------- | ------------------------- |
| `${1maj}`    | Première lettre majuscule | `hello` → `Hello`         |
| `${1cap}`    | Première lettre majuscule | `world` → `World`         |
| `${1upper}`  | Tout en majuscule         | `hello` → `HELLO`         |
| `${1lower}`  | Tout en minuscule         | `HELLO` → `hello`         |
| `${1pascal}` | PascalCase                | `my_var` → `MyVar`        |
| `${1camel}`  | camelCase                 | `my_var` → `myVar`        |
| `${1snake}`  | snake_case                | `MyVar` → `my_var`        |

**Exemple :**

```json
{
  "react_component": {
    "prefix": "rfc",
    "body": [
      "const ${1pascal} = () => {",
      "  return <div className=\"${1snake}\">${2}</div>;",
      "};",
      "",
      "export default ${1pascal};"
    ]
  }
}
```

### Avec valeurs par défaut et transformations

```json
{
  "class_component": {
    "prefix": "cc",
    "body": [
      "class ${1maj:Component} extends React.Component {",
      "  constructor(props) {",
      "    super(props);",
      "    this.state = { ${2:loading}: ${3:false} };",
      "  }",
      "}"
    ]
  }
}
```

## 🗂️ Variables de fichier (TM\_\*)

### Variables de nom de fichier

| Variable                | Description                | Exemple (fichier: `user-profile.tsx`) |
| ----------------------- | -------------------------- | ------------------------------------- |
| `${TM_FILENAME}`        | Nom complet avec extension | `user-profile.tsx`                    |
| `${TM_FILENAME_BASE}`   | Nom sans extension         | `user-profile`                        |
| `${TM_FILENAME_PASCAL}` | PascalCase                 | `UserProfile`                         |
| `${TM_FILENAME_CAMEL}`  | camelCase                  | `userProfile`                         |
| `${TM_FILENAME_SNAKE}`  | snake_case                 | `user_profile`                        |
| `${TM_FILENAME_KEBAB}`  | kebab-case                 | `user-profile`                        |
| `${TM_FILENAME_UPPER}`  | MAJUSCULES                 | `USER-PROFILE`                        |
| `${TM_FILENAME_LOWER}`  | minuscules                 | `user-profile`                        |

**Exemple :**

```json
{
  "react_component": {
    "prefix": "rfc",
    "body": [
      "import React from 'react';",
      "",
      "interface ${TM_FILENAME_PASCAL}Props {",
      "  children?: React.ReactNode;",
      "}",
      "",
      "const ${TM_FILENAME_PASCAL}: React.FC<${TM_FILENAME_PASCAL}Props> = ({ children }) => {",
      "  return (",
      "    <div className=\"${TM_FILENAME_KEBAB}\">{children}</div>",
      "  );",
      "};",
      "",
      "export default ${TM_FILENAME_PASCAL};"
    ]
  }
}
```

### Variables de chemin

| Variable                   | Description           | Exemple                                        |
| -------------------------- | --------------------- | ---------------------------------------------- |
| `${TM_DIRECTORY}`          | Nom du dossier parent | `components`                                   |
| `${TM_FILEPATH}`           | Chemin complet        | `/home/user/project/src/components/Button.tsx` |
| `${TM_FILENAME_DIRECTORY}` | Chemin du dossier     | `/home/user/project/src/components`            |

## 📅 Variables de date et heure

| Variable                | Description      | Exemple  |
| ----------------------- | ---------------- | -------- |
| `${CURRENT_YEAR}`       | Année actuelle   | `2024`   |
| `${CURRENT_MONTH}`      | Mois (numérique) | `03`     |
| `${CURRENT_DATE}`       | Jour du mois     | `15`     |
| `${CURRENT_HOUR}`       | Heure (24h)      | `14`     |
| `${CURRENT_MINUTE}`     | Minute           | `30`     |
| `${CURRENT_MONTH_NAME}` | Nom du mois      | `March`  |
| `${CURRENT_DAY_NAME}`   | Nom du jour      | `Friday` |

**Exemple :**

```json
{
  "header_comment": {
    "prefix": "header",
    "body": [
      "/**",
      " * @file ${TM_FILENAME}",
      " * @author ${1:Your Name}",
      " * @date ${CURRENT_DATE}/${CURRENT_MONTH}/${CURRENT_YEAR}",
      " * @description ${2:File description}",
      " */"
    ]
  }
}
```

## 🏢 Variables de workspace

| Variable              | Description         | Exemple                                  |
| --------------------- | ------------------- | ---------------------------------------- |
| `${WORKSPACE_NAME}`   | Nom du projet       | `my-awesome-project`                     |
| `${WORKSPACE_FOLDER}` | Chemin du workspace | `/home/user/projects/my-awesome-project` |

## 🎲 Variables utilitaires

| Variable  | Description | Exemple                                |
| --------- | ----------- | -------------------------------------- |
| `${UUID}` | UUID généré | `f47ac10b-58cc-4372-a567-0e02b2c3d479` |

## 📦 Imports automatiques

Ajoutez un import automatique avec la propriété `import` :

```json
{
  "react_state": {
    "prefix": "us",
    "body": "const [${1:state}, set${1cap}] = useState(${2:null});",
    "import": "import { useState } from 'react';"
  },

  "styled_component": {
    "prefix": "sc",
    "body": [
      "const ${TM_FILENAME_PASCAL} = styled.div`",
      "  ${1:/* styles */}",
      "`;"
    ],
    "import": "import styled from 'styled-components';"
  }
}
```

L'import sera automatiquement ajouté en haut du fichier s'il n'existe pas déjà.

## 📋 Exemples complets

### React Component avec TypeScript

```json
{
  "react_ts_component": {
    "prefix": "rtsc",
    "body": [
      "import React from 'react';",
      "",
      "interface ${TM_FILENAME_PASCAL}Props {",
      "  ${1:children?: React.ReactNode;}",
      "}",
      "",
      "const ${TM_FILENAME_PASCAL}: React.FC<${TM_FILENAME_PASCAL}Props> = ({",
      "  ${2:children}",
      "}) => {",
      "  return (",
      "    <${3:div} className=\"${TM_FILENAME_KEBAB}\">",
      "      {${2:children}}",
      "    </${3:div}>",
      "  );",
      "};",
      "",
      "export default ${TM_FILENAME_PASCAL};"
    ]
  }
}
```

### Test unitaire

```json
{
  "vitest_test": {
    "prefix": "test",
    "body": [
      "import { describe, it, expect } from 'vitest';",
      "import { ${TM_FILENAME_BASE} } from './${TM_FILENAME_BASE}';",
      "",
      "describe('${TM_FILENAME_BASE}', () => {",
      "  it('${1:should work correctly}', () => {",
      "    ${2:// Arrange}",
      "    ${3:// Act}",
      "    ${4:// Assert}",
      "    expect(${5:true}).toBe(${6:true});",
      "  });",
      "});"
    ]
  }
}
```

### Express Route

```json
{
  "express_route": {
    "prefix": "route",
    "body": [
      "router.${1|get,post,put,delete|}('/${2:path}', async (req, res) => {",
      "  try {",
      "    ${3:// Route logic}",
      "    res.json({ ${4:success: true} });",
      "  } catch (error) {",
      "    res.status(500).json({ error: error.message });",
      "  }",
      "});"
    ],
    "import": "import express from 'express';"
  }
}
```

## 🔧 Commandes utiles

### Dans Neovim

- `:SnippetsReload` - Recharger tous les snippets
- `:SnippetsList` - Afficher la liste des snippets chargés

### Utilisation

1. Tapez le `prefix` du snippet
2. Appuyez sur `Tab` pour l'activer
3. Tapez le contenu du premier placeholder
4. Appuyez sur `Tab` pour passer au suivant
5. `Shift+Tab` pour revenir en arrière

## 💡 Bonnes pratiques

### Organisation des fichiers

- Un fichier par langage/framework : `react.json`, `vue.json`, `python.json`
- Grouper par catégories : `components.json`, `tests.json`, `utils.json`

### Nommage des triggers

- Court mais descriptif : `rfc` (React Function Component)
- Logique cohérente : `us` (useState), `ue` (useEffect)
- Éviter les conflits avec les mots existants

### Structure des snippets

```json
{
  "nom_descriptif": {
    "prefix": "trigger_court",
    "body": [
      "// Utilisez des arrays pour les lignes multiples",
      "// ${1:placeholder_avec_description}",
      "// Terminez par $0 pour la position finale"
    ],
    "description": "Description claire pour l'autocomplétion"
  }
}
```

### Exemples d'organisation

**`react.json`**

```json
{
  "react_function_component": { "prefix": "rfc", ... },
  "react_class_component": { "prefix": "rcc", ... },
  "use_state": { "prefix": "us", ... },
  "use_effect": { "prefix": "ue", ... }
}
```

**`tests.json`**

```json
{
  "describe_block": { "prefix": "desc", ... },
  "test_case": { "prefix": "test", ... },
  "before_each": { "prefix": "be", ... }
}
```

---

_Ce système de snippets vous permet de coder beaucoup plus rapidement en automatisant les patterns répétitifs !_ ⚡
