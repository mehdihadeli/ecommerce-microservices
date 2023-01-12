using FluentAssertions;
using NSubstitute;

namespace Tests.Shared.Fixtures.Tests;

public class PostgresContainerFixtureTests : IAsyncLifetime
{
    private PostgresContainerFixture _fixture = default!;

    [Fact]
    public async Task init_container()
    {
        _fixture.Container.Should().NotBeNull();
        _fixture.Container.ConnectionString.Should().NotBeEmpty();
    }

    [Fact]
    public async Task reset_database()
    {
        await _fixture.ResetDbAsync();
    }

    public async Task InitializeAsync()
    {
        var sink = Substitute.For<IMessageSink>();
        _fixture = new PostgresContainerFixture(sink);
        await _fixture.InitializeAsync();
    }

    public async Task DisposeAsync()
    {
        await _fixture.DisposeAsync();
    }
}
