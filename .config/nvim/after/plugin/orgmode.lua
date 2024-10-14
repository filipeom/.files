local orgmode = require('orgmode')

orgmode.setup({
  org_agenda_files = { '~/areas/orgmode/*' },
  org_default_notes_file = '~/areas/orgmode/refile.org',
  org_todo_keywords = { 'TODO(t)', '|', 'DONE(d)', 'CANCELLED(c)' },
  org_capture_templates = {
    t = {
      description = 'Task',
      template = '* TODO %?\n  %u',
      target = '~/areas/orgmode/todo.org',
    },
    n = {
      description = 'Note',
      headline = 'Random Notes',
      template = '** %?',
      target = '~/areas/orgmode/notes.org',
      properties = {
        empty_lines = 1,
      }
    },
    m = {
      description = 'Meeting',
      template = '* %? :meeting:%^g \n  %u\n** Attendees\n***\n** Notes\n** Action Items\n*** TODO [#A] ',
      datetree = {
        tree_type = 'week'
      },
      target = '~/areas/orgmode/meetings.org',
      properties = {
        empty_lines = 1,
      }
    }
  },
})
