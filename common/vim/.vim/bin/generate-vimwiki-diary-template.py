#!/usr/bin/env python

import sys
import datetime

template = """# {date}

## Daily Scrum Master

### How is my team doing?

* tbd

### How is my PO doing?

* tbd

### How am I doing?

* tbd


## Todo

* [ ] todo


## Notes
"""

print(template.format(date=datetime.date.today()))

