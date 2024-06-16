class Message < ApplicationRecord
    enum status: { unread: 0, read: 1 }
    enum sender: { rabin: 0, crush: 1 }
end
