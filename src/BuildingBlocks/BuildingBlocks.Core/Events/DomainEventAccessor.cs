using BuildingBlocks.Abstractions.Events;

namespace BuildingBlocks.Core.Events;

public class DomainEventAccessor(
    IAggregatesDomainEventsRequestStorage aggregatesDomainEventsStorage,
    IDomainEventContext domainEventContext
) : IDomainEventsAccessor
{
    public IReadOnlyList<IDomainEvent> UnCommittedDomainEvents
    {
        get
        {
            var events = aggregatesDomainEventsStorage.GetAllUncommittedEvents();
            if (events.Count != 0)
            {
                return events;
            }

            // Or
            return domainEventContext.GetAllUncommittedEvents();
        }
    }
}