# Robot Framework Login Test — SauceDemo

A small Robot Framework project that automates login testing on the public
practice site [saucedemo.com](https://www.saucedemo.com/) using SeleniumLibrary.

It covers two scenarios:
1. **Valid login** — checks the user reaches the Products page.
2. **Invalid login** — checks the correct error message is shown.

## Project structure

```
RobotFrameworkDemo/
├── tests/
│   └── login_tests.robot   # test suite
├── requirements.txt         # dependencies
└── README.md
```

## Setup (PyCharm)

1. **Open the project folder** in PyCharm (`File > Open` → select `RobotFrameworkDemo`).

2. **Create a virtual environment** (PyCharm will usually prompt you to do this
   automatically when it detects `requirements.txt`). If not, do it manually:
   - `File > Settings > Project > Python Interpreter > Add Interpreter > Add Local Interpreter`
   - Choose **Virtualenv Environment** → **New**.

3. **Install dependencies** — open the Terminal tab in PyCharm and run:
   ```
   pip install -r requirements.txt
   ```

4. **Install the Robot Framework PyCharm plugin** (optional but recommended):
   - `File > Settings > Plugins` → search **"Robot Framework Support"** → Install → Restart PyCharm.
   - This gives you syntax highlighting, test run buttons, and keyword auto-complete for `.robot` files.

5. **Install ChromeDriver** so Selenium can control Chrome:
   - Easiest option: `pip install webdriver-manager` and let Selenium Manager (built into Selenium 4.6+) handle the driver automatically — no extra setup needed in most cases.
   - Alternatively, download ChromeDriver manually from https://chromedriver.chromium.org/ and make sure it's on your system PATH, matching your installed Chrome version.

## Running the tests

**From the PyCharm Terminal:**
```
robot tests/login_tests.robot
```

**From the Robot Framework plugin** (if installed):
Right-click `login_tests.robot` in the Project pane → **Run**.

## Output

Each run generates:
- `report.html` — pass/fail summary
- `log.html` — detailed step-by-step execution log
- `output.xml` — raw result data

Open `report.html` or `log.html` in a browser to review results.

## Notes

- This project uses only Robot Framework + SeleniumLibrary — no extra frameworks.
- `secret_sauce` / `standard_user` are SauceDemo's published test credentials, not real login data.
